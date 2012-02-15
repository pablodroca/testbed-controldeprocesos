function [ self ] = conexion(modoConexion)
   self.modoConexion = modoConexion;
   self.conectado = 0;
   self = class(self, 'conexion');
   
end

