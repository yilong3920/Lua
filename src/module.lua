module={}
module.con="connnn"
local function fun2()
	print("局部函数")
end
module.fun3=fun2
module.fun2=fun2
--有了 return 后就是模块了
--return的模块与文件同名
return module