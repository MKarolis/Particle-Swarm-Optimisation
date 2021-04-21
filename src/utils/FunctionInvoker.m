classdef FunctionInvoker < handle
    
    properties (Access = private)
        fun;
    end
    properties (SetAccess = private)
        count = 0;
    end
    
    methods
        function obj = FunctionInvoker(fun)
            obj.fun = fun;
        end
        
        function res = get(obj, X)
            res = obj.fun(X);
            obj.count = obj.count + 1;
        end
        
        function resetCounter(obj)
            obj.count = 0;
        end
    end
end