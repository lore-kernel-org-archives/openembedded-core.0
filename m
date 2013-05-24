Return-Path: <ionutx.radu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 84B6061F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:31:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2013 02:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="318884734"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2013 02:31:40 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.193]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.127]) with mapi id
	14.03.0123.003; Fri, 24 May 2013 10:31:39 +0100
From: "Radu, IonutX" <ionutx.radu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 5/7] matchbox-keyboard: Update to
	0.0+gitAUTOINCa+a17b1135daab9eb4cd3647c02e82687f96d93619
Thread-Index: AQHOWGD7l717AAUUCEG+gLu6UWLS7JkUEYsW
Date: Fri, 24 May 2013 09:31:38 +0000
Message-ID: <958794DC787AD345A1A41BCD3015B650326BDD@IRSMSX102.ger.corp.intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<378bb703a42148959f40a19e2e0a64c13ecdb482.1369386157.git.ionutx.radu@intel.com>,
	<CAJTo0LZyLq2n=g4NvAsx7zyCJC5QE9ONnPEHkZsAS19=EQe13g@mail.gmail.com>
In-Reply-To: <CAJTo0LZyLq2n=g4NvAsx7zyCJC5QE9ONnPEHkZsAS19=EQe13g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] matchbox-keyboard: Update to 0.0+gitAUTOINCa+a17b1135daab9eb4cd3647c02e82687f96d93619
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
X-List-Received-Date: Fri, 24 May 2013 09:31:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=0A=
________________________________________=0A=
From: Burton, Ross [ross.burton@intel.com]=0A=
Sent: Friday, May 24, 2013 12:26 PM=0A=
To: Radu, IonutX=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH 5/7] matchbox-keyboard: Update to 0.0+gitAUTO=
INCa+a17b1135daab9eb4cd3647c02e82687f96d93619=0A=
=0A=
On 24 May 2013 10:18, Ionut Radu <ionutx.radu@intel.com> wrote:=0A=
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>=0A=
>=0A=
> matchbox-keyboard: png-fix.patch was backported. (The newest version=0A=
> contains 'png-fix.patch' changes).=0A=
=0A=
Did you test this worked on a device/qemu?  There's been some heavy=0A=
work upstream that hasn't been tested in our environment.=0A=
=0A=
I have tested only the basic functionality on qemu (core-image-sato).=0A=
=0A=
Ross=0A=

