-- Utbud

select Färg.Namn as Färg, Storlek.Namn as Storlek, Typ.Namn as Typ, Märke.Namn as Märke, Produkt.Namn as Produktnamn, Produkt.Inköpspris from Produkt
Join Färg on Färg.Id = Produkt.FärgId
Join Storlek on Storlek.ID = Produkt.StorleksId
Join Typ on Typ.Id = Produkt.TypId
Join Märke on Märke.Id = Produkt.MärkeId

-- Produkter i butikerna

select Produkt.Namn as Produkt, Count(Produkt.Namn) as Kvantitet, Butik.Namn as Butik from Produkt
Join Butik on Butik.Id = Produkt.ButikId
Group by Produkt.Namn, Butik.Namn


-- Ordrar

select [Order].Id, Produkt.Namn as Färg, Storlek.Namn as Storlek, Typ.Namn as Typ, Märke.Namn as Märke, Produkt.Namn as Produktnamn, Person.Förnamn + ' ' + Person.Efternamn as Kundnamn  from Produkt
Join Färg on Färg.Id = Produkt.FärgId
Join Storlek on Storlek.ID = Produkt.StorleksId
Join Typ on Typ.Id = Produkt.TypId
Join Märke on Märke.Id = Produkt.MärkeId
Join ProdukterIOrder on ProdukterIOrder.ProduktId = Produkt.Id
Join [Order] on [Order].Id = ProdukterIOrder.OrderId
Join Kund on Kund.Id = [Order].KundId
Join Person on Person.Id = Kund.PersonId