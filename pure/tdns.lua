--[[
	> File Name: tdns.lua
	> Author: weijie.yuan
	> Mail: yuanweijie1993@gmail.com
	> Created Time: Fri 26 May 2017 10:59:39 AM CST
--]]

package.path = package.path .. ';./?.lua;'
package.cpath = package.cpath .. ';./?.so'

-- print('test package path is : \n' .. package.path)
-- print('test cpackage path is : \n' .. package.cpath)

local resolver = require('resolver')
local json = require "dkjson"

local print = print

local _M = {}

_M._VERSION = '1.0'
local mt = {__index = _M }

local class = {}
local opts = {nameservers = {"114.114.114.114"}, timeout = 2000}

-- new resolver
local rl, err = resolver.new(class, opts)
if not rl then
	print("resolver new error : ", err)
end


local ip, e = rl:query('answerywj.com')
if ip then
	print("query result: ", json.encode(ip))
end

return _M