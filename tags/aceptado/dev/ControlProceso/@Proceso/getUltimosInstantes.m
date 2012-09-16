function instantes = getUltimosInstantes( self, cant)
    if self.instanteUltimaMuestra >= cant
        instantes = (self.instanteUltimaMuestra-cant+1):self.instanteUltimaMuestra;
    else
        instantes = [repmat([1], 1, cant-self.instanteUltimaMuestra) 1:self.instanteUltimaMuestra];
    end
    instantes = instantes';
end