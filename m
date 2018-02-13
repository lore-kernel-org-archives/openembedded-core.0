Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 34C6977BC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 01:41:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 17:41:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,505,1511856000"; d="scan'208";a="17247949"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by fmsmga007.fm.intel.com with ESMTP; 12 Feb 2018 17:41:49 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.31]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.51]) with mapi id
	14.03.0319.002; Tue, 13 Feb 2018 09:41:47 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>, OpenEmbedded
	Core Mailing List <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oeqa/sdkext: wic: add new test cases for eSDK
Thread-Index: AQHTkzoD5fITUi1K7EafNDULyGvSDKOhsMqA
Date: Tue, 13 Feb 2018 01:41:46 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D1F20A7AC@PGSMSX103.gar.corp.intel.com>
References: <1516595182-50325-1-git-send-email-rebecca.swee.fun.chang@intel.com>
In-Reply-To: <1516595182-50325-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzk0MDUwZWQtNGVhOC00YjViLTliMGUtZGEwYjA4NmQxNDIwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJLendUNHdVU0dGeFc1RE1BSW5Pc0hodDU0XC9DV011TUtLd0ZET2s0RXlDUTh0cTdSRUU4dlhkWHZDQ0krWkpUbSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: Re: [PATCH] oeqa/sdkext: wic: add new test cases for eSDK
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
X-List-Received-Date: Tue, 13 Feb 2018 01:41:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Ed has acked/reviewed on the patchset.
Link to patchset: https://patchwork.openembedded.org/patch/147467/

Regards,
Rebecca

-----Original Message-----
From: Bartosh, Eduard=20
Sent: Monday, February 12, 2018 5:09 PM
To: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Subject: Re: [OE-core] [PATCH] oeqa/sdkext: wic: add new test cases for eSD=
K

Hi Rebecca,

The patchset looks good to me.

Regards,
Ed

On 08/02/18 10:18, "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.=
com> wrote:

    Hi Ed,
   =20
    Thanks, here is the link: https://patchwork.openembedded.org/patch/1474=
67/
   =20
    Regards,
    Rebecca
   =20
    > -----Original Message-----
    > From: Bartosh, Eduard
    > Sent: Thursday, February 8, 2018 6:05 PM
    > To: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>;
    > ed.bartosh@linux.intel.com
    > Subject: Re: [OE-core] [PATCH] oeqa/sdkext: wic: add new test cases f=
or eSDK
    >=20
    > Hi Rebecca,
    >=20
    > Can you point me out on the patchset? It looks like I missed it someh=
ow.
    >=20
    > Sure, please take the maintenance, no concerns here.
    >=20
    > Regards,
    > Ed
    >=20
    > On 08/02/18 07:09, "Chang, Rebecca Swee Fun"
    > <rebecca.swee.fun.chang@intel.com> wrote:
    >=20
    >     Hi Ed,
    >=20
    >     I have pushed some basic test for wic in eSDK. I still have plan =
to extend the
    > test coverage.
    >     Could you help to provide you feedback for the basic tests?
    >=20
    >     I also plan to take up the recipe maintenance for wic-tools and b=
map-tools.
    >     Do you have any concern?
    >=20
    >     Thank you.
    >=20
    >     Regards,
    >     Rebecca

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Chang Rebecca Swee Fun
> Sent: Monday, January 22, 2018 12:26 PM
> To: OpenEmbedded Core Mailing List <openembedded-
> core@lists.openembedded.org>
> Subject: [OE-core] [PATCH] oeqa/sdkext: wic: add new test cases for eSDK
>=20
> wic is now available in the eSDK. Adding test cases to test wic utility w=
ithin eSDK.
>=20
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  meta/lib/oeqa/sdkext/cases/wic.py | 171
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdkext/cases/wic.py
>=20
> diff --git a/meta/lib/oeqa/sdkext/cases/wic.py
> b/meta/lib/oeqa/sdkext/cases/wic.py
> new file mode 100644
> index 0000000..221a290
> --- /dev/null
> +++ b/meta/lib/oeqa/sdkext/cases/wic.py
> @@ -0,0 +1,171 @@
> +import os
> +import sys
> +import shutil
> +import unittest
> +
> +from glob import glob
> +
> +from oeqa.sdkext.case import OESDKExtTestCase from
> +oeqa.core.decorator.depends import OETestDepends from
> +oeqa.core.decorator.oeid import OETestID from oeqa.utils.commands
> +import runCmd
> +
> +
> +class WicTest(OESDKExtTestCase):
> +    """Wic test within eSDK."""
> +
> +    testdir =3D "/var/tmp/wic.test.sdkext/"
> +    outfile =3D "/var/tmp/wic.test.sdkext/output.txt"
> +
> +    @OETestID(1963)
> +    def test_wic_location(self):
> +        """Check whether wic is run within eSDK sysroot"""
> +        output =3D self._run("which wic")
> +        self.assertEqual(output.startswith(self.tc.sdk_dir), True, \
> +            msg=3D"Seems that wic isn't the eSDK one : %s" % output)
> +
> +    def _exec_wic_cmd(self, cmd):
> +        """Wrapper to execute wic command and check status"""
> +        status =3D runCmd("cd %s; . %s; %s" % (self.tc.sdk_dir, self.tc.=
sdk_env,
> cmd)).status
> +        self.assertEqual(0, status)
> +
> +    def _exec_devtool_build(self):
> +        """Wrapper to build image as pre-requisite for wic"""
> +        cmd =3D "devtool build-image"
> +        runCmd("cd %s; . %s; %s" % (self.tc.sdk_dir, self.tc.sdk_env,
> + cmd))
> +
> +    def _get_img_type(self):
> +        """Wrapper to get SDK target for image creation"""
> +        # Get sdk_targets from devtool.conf
> +        conf_file =3D self.tc.sdk_dir + "conf/devtool.conf"
> +        with open (conf_file, 'r') as in_file:
> +             for line in in_file:
> +                if 'sdk_targets' in line:
> +                    image =3D line.split()
> +                    for img_name in image:
> +                        if img_name.startswith('core-image'):
> +                            break
> +        return img_name
> +
> +    def _get_line_count(self):
> +        count =3D 0
> +        with open (self.outfile, 'r') as output:
> +            count =3D sum(1 for line in output if line.rstrip('\n'))
> +        return count
> +
> +    @OETestID(1964)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_version(self):
> +        cmd =3D "wic --version"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1965)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_help(self):
> +        cmd =3D "wic --help"
> +        self._exec_wic_cmd(cmd)
> +        cmd =3D "wic -h"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1966)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_create_help(self):
> +        cmd =3D "wic create --help"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1967)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_list_help(self):
> +        cmd =3D "wic list --help"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1968)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_help_create(self):
> +        cmd =3D "wic help create"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1969)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_help_list(self):
> +        cmd =3D "wic help list"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1970)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_help_overview(self):
> +        cmd =3D "wic help overview"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1971)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_help_plugins(self):
> +        cmd =3D "wic help plugins"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1972)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_help_kickstart(self):
> +        cmd =3D "wic help kickstart"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1973)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_list_images(self):
> +        cmd =3D "wic list images"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1974)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_list_src_plugins(self):
> +        cmd =3D "wic list source-plugins"
> +        self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1976)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_listed_images_help(self):
> +        cmd =3D "wic list images"
> +        output =3D runCmd("cd %s; %s" % (self.tc.sdk_dir, cmd)).output
> +        imagelist =3D [line.split()[0] for line in output.splitlines()]
> +        for img in imagelist:
> +            cmd =3D "wic list %s help" % img
> +            self._exec_wic_cmd(cmd)
> +
> +    @OETestID(1977)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_unsupported_subcommand(self):
> +        self.assertNotEqual(0, runCmd('wic unsupported',
> + ignore_status=3DTrue).status)
> +
> +    @OETestID(1978)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_no_subcommand(self):
> +        self.assertEqual(1, runCmd('wic', ignore_status=3DTrue).status)
> +
> +    @OETestID(1979)
> +    @OETestDepends(['test_wic_location'])
> +    def test_wic_mkefidisk_image(self):
> +        self._exec_devtool_build()
> +        image =3D self._get_img_type()
> +        cmd =3D "wic create mkefidisk --image-name %s -o %s" % (image, s=
elf.testdir)
> +        self._exec_wic_cmd(cmd)
> +        self.assertEqual(1, len(glob(self.testdir +
> + "mkefidisk-*.direct")))
> +
> +    @OETestID(1980)
> +    @OETestDepends(['test_wic_location', 'test_wic_mkefidisk_image'])
> +    def test_wic_ls(self):
> +        images =3D glob(self.testdir + "mkefidisk-*.direct")
> +        self.assertEqual(1, len(images))
> +
> +        # list partition
> +        cmd =3D "wic ls %s > %s" % (images[0], self.outfile)
> +        self._exec_wic_cmd(cmd)
> +        count =3D self._get_line_count()
> +        self.assertEqual(4, count)
> +
> +        # list directory content of the first partition
> +        cmd =3D "wic ls %s:1 > %s" % (images[0], self.outfile)
> +        self._exec_wic_cmd(cmd)
> +        count =3D self._get_line_count()
> +        self.assertEqual(7, count)
> +        # clean up testdir
> +        shutil.rmtree(self.testdir)
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

