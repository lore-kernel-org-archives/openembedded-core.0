Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0239.outbound.protection.outlook.com [207.46.163.239])
	by mail.openembedded.org (Postfix) with ESMTP id 1F88D60D7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 06:41:28 +0000 (UTC)
Received: from DM2PR03MB399.namprd03.prod.outlook.com (10.141.84.148) by
	DM2PR03MB397.namprd03.prod.outlook.com (10.141.84.139) with Microsoft
	SMTP Server (TLS) id 15.0.842.7; Mon, 23 Dec 2013 06:41:27 +0000
Received: from DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) by
	DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) with mapi id
	15.00.0842.003; Mon, 23 Dec 2013 06:41:27 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Why to make branch info is mandatory for non-master commit
	with latest bitbake
Thread-Index: Ac7/qf91LoUh/rs8SPifClus9Hu3aQ==
Date: Mon, 23 Dec 2013 06:41:25 +0000
Message-ID: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.158.216]
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(199002)(189002)(76482001)(66066001)(74366001)(80976001)(80022001)(65816001)(76176001)(46102001)(51856001)(54356001)(81816001)(79102001)(53806001)(54316002)(56776001)(83322001)(77982001)(59766001)(81686001)(558084003)(63696002)(4396001)(47736001)(49866001)(74316001)(76796001)(76576001)(76786001)(2656002)(50986001)(47976001)(33646001)(74876001)(87936001)(69226001)(74706001)(56816005)(90146001)(85306002)(83072002)(81542001)(85852003)(81342001)(31966008)(74502001)(47446002)(74662001)(87266001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB397;
	H:DM2PR03MB399.namprd03.prod.outlook.com; CLIP:192.88.158.216;
	FPR:; RD:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Why to make branch info is mandatory for non-master commit with latest bitbake
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
X-List-Received-Date: Mon, 23 Dec 2013 06:41:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Previously the branch name doesn't need to be defined when a non-master bra=
nch commit is referred in recipe, this has been changed in latest bitbake.=
=20

Is this an intentional change? May I know the reason of the change if it is=
 intentional?


Best Regards,

Zhenhua

