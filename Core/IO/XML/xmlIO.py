#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/10
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : xmlIO.py

from xml.etree import cElementTree as ET
import xml.dom.minidom as Dom

_VALUE = '_value'


class XmlDict(object):
    def __init__(self, root):
        self.__data = {root.tag: self.__build(root)}

    @property
    def data(self):
        return self.__data

    def __build(self, elem):
        if elem:
            di = {}

            for sub in elem:
                if sub.tag in di:
                    if not isinstance(di[sub.tag], list):
                        di[sub.tag] = [di[sub.tag]]
                    di[sub.tag].append(self.__build(sub))
                else:
                    di.update({sub.tag: self.__build(sub)})

                if sub.text and sub.text.strip():
                    # query <node></node>: dict['node']['_value']
                    di.update({sub.tag: {_VALUE: sub.text}})

            # query <node attr1='123'></node>: dict['node']['attr1']
            di.update(self.__fixAttributes(elem))
            return di
        else:
            return self.__fixAttributes(elem)

    def __fixAttributes(self, elem):
        di = {}
        for key in elem.attrib:
            di.update({key: self.__attr(elem, key)})
        return di

    def __attr(self, elem, *args):
        if len(args) > 1:
            result = []
            for name in args:
                result.append(self.__attr(elem, name))
            return result

        [name] = args
        value = elem.attrib.get(name)
        if not value:
            return value
        elif isinstance(value, unicode):
            return value.encode('GBK')
        elif value.isdigit():
            return int(value)
        elif value.lower() in ['true', 'false']:
            return value.lower() == 'true'
        else:
            return value

    def __walkData(self, data, key):
        if '/' in key:
            _keys = [k for k in key.split('/') if k != '']
            d = data.get(_keys[0], None)
            if d:
                if len(_keys) == 1:
                    return d
                else:
                    return self.__walkData(d, '/'.join(_keys[1:]))
            else:
                return None
        else:
            return data.get(key, None)

    def getData(self, tag):
        """
        query <node></node>: dict['tag']
        :param tag: tag/subtag/subtag
        :return: the data
        """
        return self.__walkData(self.__data, tag)

    def getValue(self, tag):
        """
        query <node></node>: dict['node']['_value']
        :param tag: tag/subtag/subtag
        :return: the value
        """
        data = self.__walkData(self.__data, tag)
        if data:
            return data.get(_VALUE, None)
        else:
            return None

    def setValue(self, tag, value):
        """
        edit <node></node>: dict['node']['_value']
        :param tag: tag/subtag/subtag
        :param value: tag/subtag/subtag
        :return: none
        """
        data = self.__walkData(self.__data, tag)
        if data:
            data[_VALUE] = value
        else:
            data.update({_VALUE: value})

    def getAttribute(self, tag, key):
        """
        query <node attr1='123'></node>: dict['node']['attr1']
        :param tag: tag/subtag/subtag
        :param key: attribute text
        :return: the attribute
        """
        data = self.__walkData(self.__data, tag)
        if data:
            if isinstance(data, dict):
                return data.get(key, None)
            elif isinstance(data, list):
                return [d.get(key) for d in data if key in d.keys()]
            else:
                return None
        else:
            return None

    def setAttribute(self, tag, key, value):
        """
        edit <node attr1='123'></node>: dict['node']['attr1']
        :param tag: tag/subtag/subtag
        :param key: attribute text
        :param value: attribute value
        :return: none
        """
        data = self.__walkData(self.__data, tag)
        if data:
            if isinstance(data, dict):
                data[key] = value
            elif isinstance(data, list):
                if len(data) == len(value):
                    for i in range(len(data)):
                        data[i][key] = value[i]
                else:
                    raise Exception('wrong value length doesn\'t match data length!')
            else:
                raise Exception('wrong data type')
        else:
            raise Exception('can\'t find tag %s' % tag)


def read(filePath):
    tree = ET.parse(filePath)
    root = tree.getroot()
    return XmlDict(root)


def write(dictData, filePath):
    doc = Dom.Document()

    def iterCreateElement(parent, tag, data):
        node = doc.createElement(tag)

        for k, v in data.items():
            if isinstance(v, dict):
                iterCreateElement(node, k, v)
            elif isinstance(v, list):
                for subV in v:
                    iterCreateElement(node, k, subV)
            else:
                if isinstance(v, unicode):
                    value = v.encode('GBK')
                elif isinstance(v, int) or isinstance(v, float) or isinstance(v, long) or isinstance(v, complex):
                    value = str(v)
                elif isinstance(v, bool):
                    value = str(v).lower()
                else:
                    value = v
                if k == _VALUE:
                    textNode = doc.createTextNode(value)
                    node.appendChild(textNode)
                else:
                    node.setAttribute(k, value)

            parent.appendChild(node)

    for k, v in dictData.items():
        iterCreateElement(doc, k, v)

    xmlString = doc.toprettyxml(indent='\t', newl='\n', encoding='utf-8')
    with open(filePath, 'w') as f:
        f.write(xmlString)

