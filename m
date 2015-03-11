Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Mar 2015 10:38:10 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.201])
	by mail.openembedded.org (Postfix) with ESMTP id CA29073AD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 10:38:10 +0000 (UTC)
Received: from [216.82.241.196] by server-9.bemta-8.messagelabs.com id
	4A/9F-19216-86910055; Wed, 11 Mar 2015 10:31:04 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-10.tower-46.messagelabs.com!1426069861!7713215!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 6.13.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17818 invoked from network); 11 Mar 2015 10:31:02 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-10.tower-46.messagelabs.com with AES128-SHA encrypted SMTP;
	11 Mar 2015 10:31:02 -0000
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0224.002;
	Wed, 11 Mar 2015 11:30:59 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: 'Saul Wold' <saul.wold@intel.com>, 'Otavio Salvador'
	<otavio@ossystems.com.br>
Thread-Topic: [OE-core] [backport][dizzy][daisy] utils.bbclass: fix
	create_cmdline_wrapper
Thread-Index: AQHQVawzlc0XqencZEmJkjC5Us5gw50K18sAgAxHwDA=
Date: Wed, 11 Mar 2015 10:30:58 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0F72F5@dor-sms-xch01.digi.com>
References: <1424177294-41586-1-git-send-email-javier.viguera@digi.com>
	<54ECB8AB.1090709@digi.com> <54F59438.1070304@digi.com>
	<CAP9ODKr3GxPaxtBSPvqQ02DRU8LWP2Ybim7EzJHeFcjPD3NGOA@mail.gmail.com>
	<54F5D892.5010400@intel.com>
In-Reply-To: <54F5D892.5010400@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.188]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport][dizzy][daisy] utils.bbclass: fix create_cmdline_wrapper
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
X-List-Received-Date: Wed, 11 Mar 2015 10:38:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Saul,

> Added to my pending branch for Daisy, I am doing a sweep of the list
> now
> for a 1.6.3 build later this week.
>=20
> Sau!

I see this patch didn't make it to the just-built 'yocto-1.6.3.rc1'.

Is there any problem with it? It's included in master and Dizzy but if it n=
eeds rework for Daisy I can do that.

-
Thanks

Javier Viguera


