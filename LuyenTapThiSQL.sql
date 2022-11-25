Use HowKteam
use QLBanSach;
exec sp_addlogin ltest1, 123

exec sp_addlogin ltest2, 123

exec sp_adduser ltest1, a

exec sp_adduser ltest2, b

grant select on [dbo].[tKhachHang] to a

grant select on [dbo].[tHoaDonBan] to a

grant select on [dbo].[tKhachHang] to b



