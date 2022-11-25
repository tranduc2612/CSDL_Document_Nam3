use QUANLYLINHKIEN

exec sp_addlogin duc,123
exec sp_adduser duc,duc

exec sp_addlogin tam,123
exec sp_adduser tam,tam

grant select on HOADON to duc with grant option