function [ self ] = LogComentario( numero, texto, instante, valor)
   self.numero = numero;
   self.texto = texto;
   self.instante = instante;
   self.valor = valor;
   self = class(self, 'LogComentario');
end

