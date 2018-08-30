-- Utbud

select F�rg.Namn as F�rg, Storlek.Namn as Storlek, Typ.Namn as Typ, M�rke.Namn as M�rke, Produkt.Namn as Produktnamn, Produkt.Ink�pspris from Produkt
Join F�rg on F�rg.Id = Produkt.F�rgId
Join Storlek on Storlek.ID = Produkt.StorleksId
Join Typ on Typ.Id = Produkt.TypId
Join M�rke on M�rke.Id = Produkt.M�rkeId

-- Produkter i butikerna

select Produkt.Namn as Produkt, Count(Produkt.Namn) as Kvantitet, Butik.Namn as Butik from Produkt
Join Butik on Butik.Id = Produkt.ButikId
Group by Produkt.Namn, Butik.Namn


-- Ordrar

select [Order].Id, Produkt.Namn as F�rg, Storlek.Namn as Storlek, Typ.Namn as Typ, M�rke.Namn as M�rke, Produkt.Namn as Produktnamn, Person.F�rnamn + ' ' + Person.Efternamn as Kundnamn  from Produkt
Join F�rg on F�rg.Id = Produkt.F�rgId
Join Storlek on Storlek.ID = Produkt.StorleksId
Join Typ on Typ.Id = Produkt.TypId
Join M�rke on M�rke.Id = Produkt.M�rkeId
Join ProdukterIOrder on ProdukterIOrder.ProduktId = Produkt.Id
Join [Order] on [Order].Id = ProdukterIOrder.OrderId
Join Kund on Kund.Id = [Order].KundId
Join Person on Person.Id = Kund.PersonId