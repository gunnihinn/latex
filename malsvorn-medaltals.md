# Málsvörn meðaltals

## Af hverju ekki meðaltal?

Ég heiti Gunnar og er fágaður diffurrúmfræðingur.
(Hæ Gunnar.)
Ég eyddi árunum mínum í grunnnáminu í að velja mig eins langt frá hagnýttri stærðfræði og hægt var.
Ég tók námskeið í rúmfræði og barðist fyrir að fá rökfræði kennda í vali.
Eftir það fór ég svo til Frakklands, þar sem fólk telst seint vera hagnýtt.

Ferilskráin mín síðan ég flosnaði upp úr námi eftir doktor lítur út eins og ítrun Newtons í átt að meiri illsku.
Ég byrjaði í akademíu, vann svo við útgáfu, svo hjá ferðafyrirtæki, og loks hjá vogunarsjóði.
Eftir því sem vinnan mín varð illri þurfti ég meir og meir á tölfræði að halda.
Ég þurfti því að læra einhverja tölfræði.
Af hverju?

Mynd 1: Illska vs. tími

Mynd2 : Illska og tölfræði vs. tími

Ég vann í fimm ár hjá Booking.com, aðallega við að reka leitarvélina þeirra sem finnur staði til að gista á.
Þessi leitarvél er forrit sem var þá keyrt á um 1500 tölvum, dreifðum yfir nokkur gagnaver í Evrópu.
Frá hverri tölvu fengum við stöðugan straum af gögnum um hvað hún var að gera; hversu mikið minni eða örgjörvi var í notkun, hversu mörgum beiðnum hún hafði svarað, hversu margar villur höfðu komið fyrir.
Allt kerfið fékk svo um 100.000 beiðnir á sekúndu.
Þetta voru allt of miklar upplýsingar til að líta á hverja tölvu fyrir sig, svo við notuðum tölfræðileg tól til að sjóða þær niður.

Það eru til mörg forrit sem gera slíka hluti við tímaraðir.
Þau bjóða manni upp á helstu reikniaðgerðir -- samlangninu og frádrátt, margföldun og deilingu -- og helstu tól eins og meðaltal, staðalfrávik, há- og lágmark, og miðgildi og aðrar prósentur.
Það var líka mikil þjóðsagnaviska í gangi, eins og að maður ætti helst ekki að nota meðaltal og staðalfrávik til að greina svona gögn, heldur frekar prósentur.

![Tölfræði](./tshirt.jpg)

Að hluta til var það af því að þau fyrri eru viðkvæm fyrir mjög stórum frávikum; meðaltalið af gildunum 0, 0 og _n_ stefnir á óendanlegt eftir því sem _n_ verður stærra, á meðan að miðgildið helst 0.
Ef við erum að þjóna beiðnir og það tekur 20 millisekúndur að svara næstum öllum þeirra, þá er okkur þannig séð alveg sama þó það taki 10 sekúndur að svara einni af hverjum milljón beiðnum.

Önnur ástæða sem fólk nefndi fyrir að nota ekki meðaltal og staðalfrávik voru gagnasett á borð við þessi:

![Anscombe's quartet](./anscombe.png)

Nýlegri útgáfa af svipuðu gagnasetti er:

![Datasaurus dozen](./datasaurus.gif)

Hér eru meðaltölin og staðalfrávikin af x- og y-hnitunum þau sömu á öllum myndunum, en myndirnar eru mjög frábrugðnar hvor annarri.
Niðurstaðan sem fólkið sem bjó til myndirnar vildi benda á er að það þarf eitthvað meira en meðaltal og staðalfrávik til að greina gögn, til dæmis að horfa á gögnin.
Niðurstaðan sem mikið af fólki sem ég hef hitt hefur komist að er að meðaltal og staðalfrávik séu ekki góð.


## Hvað er aftur meðaltal?

Sá sem talar um meðaltal talar um líkindi, svo meðaltal á náttúrlega heima á líkindarúmi.
Fyrir þá sem ekki muna eru það þrír hlutir: Rúm, safn af hlutmengjum sem uppfylla ákveðin skilyrði, og mál sem mælir stærð hlutmengjanna, sem er líkindamál ef allt rúmið hefur massann einn.
Þeir sem muna alls ekki hvað þetta er geta ímyndað sér rúmið \( X = \{1, \ldots, n\} \), öllum hlutrúmum, og talningarmálinu \( \lambda(Y) = |Y| / n \).

Við höfum áhuga á atburðum sem gerast á rúminu okkar, sem við táknum sem raungildum föllum \( f : X \to \mathbb{R} \).
Þau verða að vera mælanleg, sem er skilyrði sem við ætlum ekki að ræða, en leyfir okkur að skilgreina heildi þeirra \( \int_X f d\lambda \).
Við táknum mengi allra þessara falla með \( F(X) \).
Vegna þess að við erum í líkindarúmi er heildið af fastafallinu 1 jafnt 1.
Í dæminu að ofan eru öll föll mælanleg, svo við erum að skoða föll \( f : \{ 1, \ldots, n \} \to \mathbb{R} \).
Mengi þeirra er bara \( \mathbb{R}^n \), og fastafallið \( c \) svarar til hornalínunnar \( (c, c, \ldots, c) \).

Við ætlum að halda okkur við þau föll á rúminu okkar sem við getum margfaldað saman og heildað.
Eins konar \( L^2 \) rúm.
Á þeim föllum getum við skilgreint innfeldi \( \langle f, g \rangle = \int_X fg d\lambda \).

Nú höfum við einhvern atburð \( f \) í höndunum og langar að vita eitthvað um hann.
Einu atburðirnir sem við eigum auðvelt með að benda á í líkindarúminu okkar eru fastaföllin.
Atburðurinn okkar er kannski ekki fastafall, en **hvað væri hann ef hann væri fastafall**?
Til að svara því lágmörkum við normið 
\[ 
\| f - c \|^2 
= \| f \|^2 - 2 \langle f, c \rangle + c^2
\]
sem fall af \( c \) og finnum \( c = \langle f, 1 \rangle = \int_X f d\lambda \).
Þetta er einmitt meðaltal \( f \):
Hornrétt ofanvarp \( f \) á línuna af fastaföllum.

Fyrst við vitum hver atburðurinn okkar væri ef hann væri fastafall liggur beinast við að spyrja **hversu langt er hann frá því að vera fastafall**?
Svarið er \( \|f - \langle f, 1 \rangle \| \), betur þekkt sem staðalfrávik \( f \).

Í raun á staðalfrávikið betur heima á deildarúminu \( F(X) / \mathbb{R} \) þar sem við deilum út fastaföllunum.
Þar er staðalfrávikið bara norm atburðar, og samfylgni atburða er innfeldi þeirra.


## Af hverju koma slæmir hlutir fyrir gott fólk?

Þessum útúrdúr lokið skulum við víkja aftur að gagnasettunum okkar.
Í þeim erum við með nokkra mismunandi atburði sem hafa allir sama meðaltal og staðalfrávik.

Eftir það sem við höfum séð vitum við að atburðir með fast meðaltal \( \mu \) liggja á ofurplani
\[
\{ f \in F(X) \mid \mu(f) = \langle f, 1 \rangle = \mu \}.
\]
Þar að auki liggja atburðir með fast staðalfrávik \( \sigma \) í menginu
\[
\{ f \in F(X) \mid \sigma(f) = \| f - \mu(f) \| = \sigma \}.
\]
Sniðmengi þeirra er einfaldlega
\[
\{ f \in F(X) \mid \| f - \mu \| = \sigma \},
\]
sem við þekkjum betur sem kúlu með geisla \( \sigma \) og miðju \( \mu \).
(Athugið að kúlan liggur í ofurplaninu, ekki öllu rúminu.)

Bæði gagnasett Anscombe's og gagnasárusinn eru byggð á líkindarúminu sem samanstendur af \( n \) punktum, svo rúmið af atburðum á þeim er \( \mathbb{R}^n \).
Mengið af öllum atburðum sem hafa sama meðaltal og staðalfrávik er því kúla af vídd \( n-2 \) í Evklíðska rýminu.
Það sem Anscombe sýnir okkur er því ofanvarp af 8-víðri kúlu ofan á miklu minna rúm, og gangasárusinn sýnir okkur ofanvarp af 140-víðri kúlu á sama rúm.
Kemur á óvart að það sé hægt að búa til alls konar myndir út frá punktum á 140-víðri kúlu?


## J'ACCUSE

Tökum smá skref aftur á bak.
Hvað eru staðalfrávik og meðaltal?
Hvað eru lág- og hámark, eða önnur p-gildi?
Eða hvaða annað tölfræðilegt tól sem er?

Þetta eru allt raungild föll á atburðarúminu okkar.
Þau eru samfelld, og deildanleg alls staðar nema hugsanlega í nokkrum punktum sem liggja á núllmengi og okkur er þar af leiðandi alveg sama um.
(Ef við ætlum að sigra líkindafræðingana verðum við að hugsa eins og þeir.)

Segjum að við veljum nokkur tölfræðileg tól \( t_1, \ldots, t_m \) og viljum að þau taki einhver föst gildi \( v_1, \ldots, v_m \).
Mengið þar sem eitt tól tekur fast gildi ætti að vera hlutvíðátta af hjávídd 1 í atburðarúminu.
Þegar við tökum sniðmengið af öllum þessum mengjum ættum við því að fá hlutvíðáttu af hjávídd \( m \).

(Nota bene: Af einhverjum ástæðum þráast fólk við að fremja tölfræði yfir rauntölurnar í staðinn fyrir tvinntölurnar, eða algebrulega lokað svið, þar sem rúmfræði hegðar sér miklu betur. Við veifum höndum í átt að núllmengi.)

Ef við erum í sama rúmi og áður og veljum nógu marga punkta til að skoða, þá er vídd Anscombe mengisins af punktum sem hafa sama gildi á öllum þessum tölfræðilegu tólum jöfn \( n - m \).
Við ættum því að búast við sama fyrirbæri hjá hvaða safni af tölfræðilegum tólum sem er.


## Hvað höfum við lært?

Mismunandi tölfræðileg tól svara mismunadi spurningum.
Meðaltal og staðalfrávik segja hver gildin okkar væru ef þau væru öll þau sömu og hversu langt frá því að vera öll eins þau eru.
Hvort það séu góðar spurningar til að spyrja fer eftir hvað við erum að gera.

Ef við erum að reyna að finna út sjálfvirkt hvort einhver gildi á borð við beiðnir á sekúndu eða hlutabréfaverð hegði sér eins og þau gerðu síðast þegar við gáðum gætu þau verið fín tól.

Ef við erum að reyna að segja hvort við svörum flestum beiðnum undir einhverju marki, eða finna út hversu marga netþjóna við þurfum að kaupa til að geta annað eftirspurn á næsta háannatímabili, eru þetta vond tól.

Það eina sem við getum gert er að skilja spurningarnar sem við viljum svara, tölfræðilegu tólin sem við höfum, og muna að allt með gagnrýnum hug.
Það eru ekki til styttri leiðir eins og nota aldrei staðalfrávik eða meðaltal.
Við þurfum bara að hugsa.

Þetta eru óhemjulega óvinsæl skilaboð, sem engann langar að heyra, og munu afla ykkur margra óvina á nýju ári.

Gleðilegt jól, og farsælt komandi ár.

(Dynjandi, óstöðvandi lófatak.)
