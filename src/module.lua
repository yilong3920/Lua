module={}
module.con="connnn"
local function fun2()
	print("�ֲ�����")
end
module.fun3=fun2
module.fun2=fun2
--���� return �����ģ����
--return��ģ�����ļ�ͬ��
return module