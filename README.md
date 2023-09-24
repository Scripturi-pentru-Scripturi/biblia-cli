# biblia-cli - Biblia în linia de comandă ☦️

O unealtă pentru a citi Sfânta Scriptură în linia de comandă, care se bazează pe coreutils și poate rula in orice POSIX environment ca Linux, BSD, MacOS, Haiku, Cygwin și altele.

---

### Matei 22:29	
> Răspunzând, Iisus le-a zis: Vă rătăciţi neştiind Scripturile, nici puterea lui Dumnezeu. 

## Cerințe

* POSIX environment (Linux, BSD, MacOS, Haiku, Cygwin, etc.)
* coreutils (awk, sed, tar, less, cat)
* Shell (bash, zsh, etc.)

## Funcționalități

* Caută versete după cuvinte cheie
* Caută versete după numărul de carte, capitol și verset
* Listă cărți, capitole și versete
* Citirea versetelor în linii largi
* Printarea versetelor în stdout
* Mod interactiv
  * Rulează `biblia-cli` fără argumente pentru a intra în modul interactiv
  * Apoi poți introduce comenzile dorite

## Instalare

1. Clonează acest repository 
```bash
git clone https://github.com/tragdate/biblia-cli.git
cd biblia-cli
```
2. Rulează scriptul de instalare
```bash
sudo make install
```
3. Dezinstalarea
```bash
sudo make uninstall
```

## Utilizare

```bash
biblia-cli [flag] [referință...]
```

### Flaguri

* `-h` Ajutor: Afișează acest mesaj de ajutor
* `-l` Listează: Afișează lista de cărți
* `-W` Linii largi: Afișează textul fără împărțirea în linii

### Referințe
```text
   <Carte>
     Cărțile pot fi specificate în mai multe moduri:
       Numele complet al cărții (ex: Facerea)
       Abrevierea cărții (ex: Fa)

   <Carte>:<Capitol>
     Un capitol întreg dintr-o carte (ex: Facerea:1)

   <Carte>:<Capitol>:<Verset/e>
     Un verset dintr-un capitol dintr-o carte (ex: Facerea:1:1) sau mai multe versete (ex: Facerea:1:1-3)

   <Carte>:<Capitol>-<Capitol>
     Mai multe capitole dintr-o carte (ex: Facerea:1-3)

   <Carte>:<Capitol>:<Verset>-<Verset>
     Mai multe versete dintr-un capitol dintr-o carte (ex: Facerea:1:2-3)

   <Carte>:<Capitol>:<Verset>-<Capitol>:<Verset>
     Mai multe versete din mai multe capitole dintr-o carte (ex: Facerea:1:1-3:2)

 Căutare:
   Căutarea se poate face prin adăugarea flagului / urmat de un cuvânt cheie
   Ex: biblia-cli /Adam

   Căutarea se poate face și în interiorul unei cărți
   Ex: biblia-cli Facerea /Adam

   Căutarea se poate face și în interiorul unui capitol
   Ex: biblia-cli Facerea:1 /Adam
``` 

# Tabel de abrevieri a cărților biblice

| Nume  | Abreviere | Nume Alternativ (nefolosit în script) |
|-------|-----------|------------------------------------|
|Facerea|Fc|Geneza|
|Ieşirea|Ies|Exodul|
|Leviticul|Lv|Cartea a treia a lui Moise|
|Numerii|Num|Numerele|
|Deuteronomul|Dt|Cartea a cincea a lui Moise|
|Iosua Navi|Ios|Cartea lui Iosua Navi|
|Judecători|Jd|Cartea Judecătorilor|
|Rut|Rut|Cartea Rut|
|I Regi|1Rg|Cartea întâi a Regilor|
|II Regi|2Rg|Cartea a doua a Regilor|
|III Regi|3Rg|Cartea a treia a Regilor|
|IV Regi|4Rg|Cartea a patra a Regilor|
|I Paralipomena|1Par|Cartea întâi Paralipomena (întâia a Cronicilor)|
|II Paralipomena|2Par|Cartea a doua Paralipomena (a doua a Cronicilor)|
|I Ezdra|1Ezr|Cartea întâi a lui Ezdra|
|Neemia|Ne|Cartea lui Neemia (a doua Ezdra)|
|Esterei|Est|Cartea Esterei|
|Iov|Iov|Cartea lui Iov|
|Psalmi|Ps|Psalmii|
|Proverbele lui Solomon|Pr|Pildele lui Solomon|
|Ecclesiastul|Ecc|Ecclesiastul|
|Cântări|Cant|Cântarea Cântărilor|
|Isaia|Is|Isaia|
|Ieremia|Ir|Ieremia|
|Plangeri|Plg|Plângerile lui Ieremia|
|Iezechiel|Iz|Iezechiel|
|Daniel|Dn|Daniel|
|Osea|Os|Osea|
|Amos|Am|Amos|
|Miheia|Mi|Miheia|
|Ioil|Ioil|Ioil|
|Avdie|Avd|Avdie|
|Iona|Ion|Cartea lui Iona|
|Naum|Naum|Naum|
|Avacum|Avc|Avacum|
|Sofonie|Sof|Sofonie|
|Agheu|Ag|Agheu|
|Zaharia|Za|Zaharia|
|Maleahi|Mal|Maleahi|
|Tobit|Tob|Cartea lui Tobit|
|Iudita|Idt|Cartea Iuditei|
|Baruh|Bar|Cartea lui Baruh|
|Epistola lui Ieremia|Epist|Ieremia|
|3 tineri|Tin|Cântarea celor trei tineri|
|III Ezdra|3Ezr|Cartea a treia a lui Ezdra|
|Solomon|Sol|Cartea Înţelepciunii lui Solomon|
|Cartea Înţelepciunii lui Isus, Fiul lui Sirah|Sir|Ecleziasticul|
|Susanei|Sus|Istoria Susanei|
|Bel şi Balaurul|Bel|Istoria omorârii balaurului şi a sfărâmarii lui Bel|
|I Macabei|1Mac|Cartea întâi a Macabeilor|
|II Macabei|2Mac|Cartea a doua a Macabeilor|
|III Macabei|3Mac|Cartea a treia a Macabeilor|
|Manase|Man|Rugăciunea lui Manase|
|Matei|Mt|Sfânta Evanghelie după Matei|
|Marcu|Mc|Sfânta Evanghelie după Marcu|
|Luca|Lc|Sfânta Evanghelie după Luca|
|Ioan|In|Sfânta Evanghelie după Ioan|
|Faptele Apostolilor|FA|Faptele Sfinţilor Apostoli|
|Romani|Rm|Epistola către Romani a Sfântului Apostol Pavel|
|I Corinteni|1Co|Epistola întâi către Corinteni a Sfântului Apostol Pavel|
|II Corinteni|2Co|Epistola a doua către Corinteni a Sfântului Apostol Pavel|
|Galateni|Ga|Epistola către Galateni a Sfântului Apostol Pavel|
|Efeseni|Ef|Epistola către Efeseni a Sfântului Apostol Pavel|
|Filipeni|Flp|Epistola către Filipeni a Sfântului Apostol Pavel|
|Coloseni|Col|Epistola către Coloseni a Sfântului Apostol Pavel|
|I Tesaloniceni|1Tes|Epistola întâi către Tesaloniceni a Sfântului Apostol Pavel|
|II Tesaloniceni|2Tes|Epistola a doua către Tesaloniceni a Sfântului Apostol Pavel|
|I Timotei|1Tim|Epistola întâi către Timotei a Sfântului Apostol Pavel|
|II Timotei|2Tim|Epistola a doua către Timotei a Sfântului Apostol Pavel|
|Tit|Tit|Epistola către Tit a Sfântului Apostol Pavel|
|Filimon|Flm|Epistola către Filimon a Sfântului Apostol Pavel|
|Evrei|Evr|Epistola către Evrei a Sfântului Apostol Pavel
|Iacov|Iac|Epistola Sobornicească a Sfântului Apostol Iacov|
|I Petru|1Ptr|Epistola Sobornicească întâia a Sfântului Apostol Petru|
|II Petru|2Ptr|Epistola Sobornicească a doua a Sfântului Apostol Petru|
|I Ioan|1In|Epistola Sobornicească întâia a Sfântului Apostol Ioan|
|II Ioan|2In|Epistola Sobornicească a doua a Sfântului Apostol Ioan|
|III Ioan|3In|Epistola Sobornicească a treia a Sfântului Apostol Ioan|
|Iuda|Iuda|Epistola Sobornicească a Sfântului Apostol Iuda|
|Apocalipsa|Ap|Apocalipsa Sfântului Ioan|

# TO-DO
- [ ] Scrape la varianta Doxologia
- [x] Actualizare pe baza textului din Doxologia
- [ ] Eventuale corecturi
- [ ] Livrarea in format GUI pentru Windows
- [ ] Livrarea in format GUI pentru MacOS 
- [ ] Livrarea in format GUI pentru Linux
- [ ] Livrarea in format WebApp

# Despre resurse
## Textul Scripturii este preluat de pe [BibliaOrtodoxa.ro](https://bibliaortodoxa.ro)

# Despre BibliaOrtodoxa.ro

Acest site este dezvoltat prin bunavointa mai multor crestini ortodocsi care au tehno-redactat, digitizat, programat si verificat textul Sfintei Scripturi pentru a-l pune la dispozitie pe internet, indeosebi in vederea unei mai facile cautari si accesari.

Site-ul nu are nici o legatura cu vreo organizatie sau asociatie oficiala, fiind o initiativa benevola care nu vine decat in umplerea unui gol: nici Patriarhia Romana nici alte mitropolii nu ofera in prezent o versiune online a Bibliei. Singura exceptie notabila este [Manastirea Dervent](http://www.dervent.ro/biblia.php) care va ofera versiunea Anania (din pacate fara facilitatea de cautare).

Textul site-ului este preluat din Biblia sau Sfanta Scriptura tiparita sub indrumarea si cu purtarea de grija a PF Teoctist, cu aprobarea Sfantului Sinod.

Initial continutul a fost preluat de pe un site vechi care nu specifica anul editiei. Corecturile ulterioare si adaugirile textelor lipsa sunt preluate din editia 1994 tiparita de Societatea Biblica Interconfesionala din Romania care reproduce textul editiei din 1982.

# Alte resurse
### [Patriarhia Română](https://www.patriarhia.ro)
### [Manastirea Dervent](http://www.dervent.ro/biblia.php)
### [Doxologia](https://www.doxologia.ro)
### [Doxologia-Biblia sau Sfânta Scriptură](https://www.doxologia.ro/biblia)
