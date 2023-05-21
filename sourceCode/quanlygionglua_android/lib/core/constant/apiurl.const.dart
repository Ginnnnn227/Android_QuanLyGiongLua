// ignore_for_file: unnecessary_brace_in_string_interps, constant_identifier_names

const ip = "192.168.1.158";
//const ip = "127.0.0.1";
const port = 88;
//const baseURL = 'http://${ip}:${port}/api/';
const baseURL = 'http://10.0.2.2:80/quanlyluagiong/api/';
//const baseURL = 'http://localhost:80/quanlyluagiong/api/';

//------------GET---------------------
const userURL = '${baseURL}users';

const nhomgiongURL = '${baseURL}nhomgiongs';
const giongURL = '${baseURL}giongs';
const kieuhinhURL = '${baseURL}kieuhinhs';
const maptnURL = '${baseURL}maptns';
const mangoaidongURL = '${baseURL}mangoaidongs';

const giaidoantruongthanhURL = '${baseURL}giaidoantruongthanhs';
const doituongtinhtrangURL = '${baseURL}doituongtinhtrangs';
const dacdiemtinhtrangURL = '${baseURL}dacdiemtinhtrangs';
const giatritinhtrangURL = '${baseURL}giatritinhtrangs';

const loaigiatridoURL = '${baseURL}loaigiatridos';

const chitieungoaidongURL = '${baseURL}chitieungoaidongs';
const giatridongoaidongURL = '${baseURL}giatridongoaidongs';

const chitieutrongnhaURL = '${baseURL}chitieutrongnhas';
const giatridotrongnhaURL = '${baseURL}giatridotrongnhas';

const loaisaubenhURL = '${baseURL}loaisaubenhs';
const chitieusaubenhURL = '${baseURL}chitieusaubenhs';
const giatridosaubenhURL = '${baseURL}giatridosaubenhs';
//-----------AUTH-------------------------
const user_authURL = '${baseURL}auth/user';
const login_authURL = '${baseURL}auth/login';
const logout_authURL = '${baseURL}auth/logout';



// const serverError = 'Server Error';
// const unauthorized = "Unauthorized";
// const somethingWentWrong = "SomeThing Went Wrong";