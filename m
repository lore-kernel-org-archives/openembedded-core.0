Return-Path: <Lauren.Post@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0144.outbound.protection.outlook.com [207.46.163.144])
	by mail.openembedded.org (Postfix) with ESMTP id 414A36EE45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 17:26:05 +0000 (UTC)
Received: from BLUPR03MB133.namprd03.prod.outlook.com (10.255.212.11) by
	BLUPR03MB133.namprd03.prod.outlook.com (10.255.212.11) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Wed, 26 Mar 2014 17:26:05 +0000
Received: from BLUPR03MB133.namprd03.prod.outlook.com ([169.254.2.26]) by
	BLUPR03MB133.namprd03.prod.outlook.com ([169.254.2.26]) with mapi id
	15.00.0898.005; Wed, 26 Mar 2014 17:26:04 +0000
From: Lauren Post <Lauren.Post@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 01/11] bluez4: Add virtual/bluez as provider
Thread-Index: AQHPSRV1py4PTdqFFEav17mXYDAdM5rznkSw
Date: Wed, 26 Mar 2014 17:26:04 +0000
Message-ID: <b7253ce230a34490bc468d58fa3c3338@BLUPR03MB133.namprd03.prod.outlook.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-2-git-send-email-lauren.post@freescale.com>
	<CAJTo0LaY7y=nzEJ88PxFd0xB7E8N4BSAhTsNco370U1VDQQetQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaY7y=nzEJ88PxFd0xB7E8N4BSAhTsNco370U1VDQQetQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.168.50]
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(199002)(189002)(377454003)(13464003)(95416001)(53806001)(2656002)(80022001)(19580395003)(98676001)(33646001)(93136001)(59766001)(77982001)(79102001)(97186001)(85306002)(63696002)(54356001)(54316002)(20776003)(94316002)(95666003)(19580405001)(76482001)(51856001)(81342001)(65816001)(66066001)(86362001)(81542001)(83322001)(31966008)(74316001)(74662001)(69226001)(46102001)(87936001)(94946001)(76786001)(74502001)(81816001)(81686001)(74706001)(76796001)(92566001)(56816005)(4396001)(77096001)(74366001)(50986001)(47736001)(49866001)(47976001)(90146001)(56776001)(93516002)(83072002)(47446002)(74876001)(97336001)(80976001)(76576001)(87266001)(85852003)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB133;
	H:BLUPR03MB133.namprd03.prod.outlook.com;
	FPR:7C9EF79D.95E2BF63.11C179D2.DAEDC828.2014A; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] bluez4: Add virtual/bluez as provider
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 17:26:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBJIGFtIHdvcmtpbmcgb24gaXQgd2l0aCBhbGwgdGhlIGZlZWRiYWNrIGZvciBvdGhlciBw
YXRjaGVzLiAgSSBtaXNzZWQgaXQgb24gbGFzdCBiYXRjaCBidXQgYmVmb3JlIEkgc2VuZCBpdCBn
b2luZyB0byBhZGQgYWxsIHRoZSBvdGhlciBjaGFuZ2VzIGluIHYyIHZlcnNpb24uDQoNCkknbGwg
cmV2aWV3IHdpdGggT3RhdmlvIGJlZm9yZSBJIHJlc3VibWl0IGFuZCB0ZXN0IHdpdGggYm90aCBi
bHVlejQgYW5kIGJsdWV6NS4NCg0KTGF1cmVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dIA0KU2Vu
dDogV2VkbmVzZGF5LCBNYXJjaCAyNiwgMjAxNCAxMjowNCBQTQ0KVG86IFBvc3QgTGF1cmVuLVJB
QTAxMw0KQ2M6IE9FLWNvcmUNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAxLzExXSBi
bHVlejQ6IEFkZCB2aXJ0dWFsL2JsdWV6IGFzIHByb3ZpZGVyDQoNClN1cmVseSB0aGVyZSBzaG91
bGQgYWxzbyBiZSBhIHBhdGNoIHRvIGRvIHRoZSBzYW1lIGZvciBibHVlejUgc28gdGhlIHN3aXRj
aCBjYW4gYmUgY29tcGlsZS10ZXN0ZWQ/DQoNClJvc3MNCg0K

