
local function main()
	function myfunction ()
		n = n/nil
	end

	function myerrorhandler( err )
		print( "ERROR:", err )
		print(debug.debug())
		print(debug.traceback())
	end

	status = xpcall( myfunction, myerrorhandler )
	print( status)

	--	local function add(a,b)
	--		assert(type(a) == "number", "a 不是一个数字")
	--		assert(type(b) == "number", "b 不是一个数字")
	--		return a+b
	--	end
	--	add(10)

	file=io.open("src/t.lua","r")
	print(file:read())
	file:close()

	local newProductor
	function productor()
		local i = 0
		while i<4 do
			i = i + 1
			send(i)     -- 将生产的物品发送给消费者
		end
	end

	function consumer(j)
		while j<5 do
			j=j+1
			local i = receive()     -- 从生产者那里得到物品
			print(i)
		end
	end

	function receive()
		local status, value = coroutine.resume(newProductor)
		return value
	end
	function send(x)
		coroutine.yield(x)-- x表示需要发送的值，值返回以后，就挂起协程
	end
	-- 启动程序
	newProductor = coroutine.create(productor)
	consumer(0)


	function foo (a)
		print("foo 函数输出", a)
		return coroutine.yield(2 * a) -- 返回  2*a 的值
	end

	co = coroutine.create(function (a , b)
		print("第一次协同程序执行输出", a, b) -- co-body 1 10
		local r = foo(a + 1)

		print("第二次协同程序执行输出", r)
		local r, s = coroutine.yield(a + b, a - b)  -- a，b的值为第一次调用协同程序时传入

		print("第三次协同程序执行输出", r, s)
		return b, "结束协同程序"                   -- b的值为第二次调用协同程序时传入
	end)

	print("main", coroutine.resume(co, 1, 10)) -- true, 4
	print("--分割线----")
	print("main", coroutine.resume(co, "r")) -- true 11 -9
	print("---分割线---")
	print("main", coroutine.resume(co, "x", "y")) -- true 10 end
	print("---分割线---")
	print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine
	print("---分割线---")

	-- coroutine_test.lua 文件
	co = coroutine.create(
	function(i)
		print(i);
	end
	)

	coroutine.resume(co, 1)   -- 1
	print(coroutine.status(co))  -- dead

	print("----------")

	co = coroutine.wrap(
	function(i)
		print(i);
	end
	)

	co(1)

	print("----------")

	co2 = coroutine.create(
	function()
		for i=1,10 do
			print(i)
			if i == 3 then
				print(coroutine.status(co2))  --running
				print(coroutine.running()) --thread:XXXXXX
			end
			coroutine.yield()
		end
	end
	)

	coroutine.resume(co2) --1
	coroutine.resume(co2) --2
	coroutine.resume(co2) --3
	--	coroutine.resume(co2) --4
	--	coroutine.resume(co2) --5
	--	coroutine.resume(co2) --6

	print(coroutine.status(co2))   -- suspended
	print(coroutine.running())

	print("----------")

	i=0
	mymetatable = {key1="valmet",fun=function ()
			print("dfgdfg")
		end
	}
	mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable})
	--	,__index=mymetatable


	print(mytable.key1)

	print(mymetatable.fun())
	--	bbb=mymetatable.fun(i)
	--	print(aaa,bbb)

	mytable.key1 = "新值1"
	print(mytable.key1,mymetatable.key1)

	--	mytable = {}                          -- 普通表
	--	other= {foo=3}  --表格
	--	mymetatable = { __index = other }                      -- 元表
	--	t=setmetatable(mytable,mymetatable)     -- 把 mymetatable 设为 mytable 的元表
	--	m=getmetetable(mytable)
	--	print (t.dkj)
	--	print (t.foo)


	--	require("module")
	--	print(module.con)
	--	module.fun3()
	--	module.fun2()

	tab1 = { key1 = "val1", key2 = "val2", "val3" }
	for k, v in pairs(tab1) do
		print(k .. " - " .. v)
	end
	print(type(type(d)))
	tab1.key1 = nil
	for k, v in pairs(tab1) do
		print(k .. " - " .. v)
	end
	if 0 then
		print("sdflk")
	else
		print("lkjklj")
	end
	a3 = {}
	for i = 1, 10 do
		a3[i] = i+10
		print(a3[i])
	end
	a3["key"] = "val"
	print(a3["key"])
	print(a3["none"])
	-- function_test.lua 脚本文件
	function factorial1(n)
		if n == 0 then
			return 1
		else
			return n * factorial1(n - 1)
		end
	end
	print(factorial1(5))
	factorial2 = factorial1
	print(factorial2(5))
	-- function_test2.lua 脚本文件
	function testFun(a,fun)--匿名函数定义 及其参数a
		print("匿名fun运行前执行，类似装饰器")
		print(fun(a).." 调用匿名函数fun");
	end
	a=3
	testFun(a,
	function(a)--匿名函数定义
		print(" 匿名函数定义 ")
		return a
	end
	)
	for i = 10, 1, -1 do
		repeat
			if i == 5 then
				print("continue code here")
				break
			end
			print(i, "loop code here")
		until true
	end


end
main()
