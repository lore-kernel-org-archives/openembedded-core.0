Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Nov 2016 09:11:13 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 83DB6719A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 09:11:12 +0000 (UTC)
Received: from elrond.localnet ([95.90.2.192]) by mail.gmx.com (mrgmx001) with
	ESMTPSA (Nemesis) id 0MQiVh-1cRgEE35xd-00TyVj;
	Thu, 03 Nov 2016 10:05:51 +0100
From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Date: Thu, 03 Nov 2016 10:05:51 +0100
Message-ID: <1955218.jzD2Ojm6fW@elrond>
User-Agent: KMail/4.14.10 (Linux/4.1.34-33-default; KDE/4.14.18; x86_64; ; )
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDFE580F6A@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1474274390-36100-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDFE57A749@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FDFE580F6A@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
X-Provags-ID: V03:K0:NjCYi/ylW/rFLoAJJ7M/yy3ANsR+0Y8PEbDxSbJlogbn/vCRlRK
	qQ9djLd40CgqUW0XraEPtfbo2KBoj15Qfg+DpWw+8I4wB+NHfccsmtbbjX/Sx36/lk8rYF1
	kXMmvfYSlCEQuLGzXa3NkN0q5imokKU9B3VpqhZJoBHHbAFTMEUhNsN6zRjOmQt29Cy5FVM
	P+gg0DpGGPjAgYSTIEkww==
X-UI-Out-Filterresults: notjunk:1;V01:K0:BgozPwOAqYw=:ak0mZJIubxeLA5FDhze7rT
	G6ajG4rFTK+Spqa/uh+uhtME76NhfMFR1DJl8o80F3d7bk7WDKDfUKo4qC6d6C5aIkQQiYKWV
	WTOyUKNnbcMarvzTwta703/l1aeF1rfyNkhRbiWh1+giEqi0ZxmbOKCdcDMPvq/BBg9SZB4dE
	K2/EmdHG/Xj4EJh4hMJuPpTCq91EhxAPEB5SAqzmHeyjXt1VXi/6k/X2X0hF6sLZOkiDjpNgF
	s94R4UNMi/Epv335z/1T91PjRiHifP9Sxqv2V8kmkzqLQOhRNjmXvJBSTQ4UTAoIg7WVouOLt
	kr2j0gSGGVU35rUaCrqhwpwLZjQCbldQAblSIyyTQ+06jjcLzoJEC0uMTwzXMK3YSbVHWiNZX
	3X61NfxH5jDQknLrqTQxtHT07N0wfmcUY/0EygRUStQLY2IFydE7p/ZvgpZU5tThYRJuKqi/r
	scqjedT3Bjk4Mg0OdYg9dTyXDdV5pQW3udJpUkPW2QTxFX2QH16h6uLRG+wHmu3SzH6IvhQ/+
	Ig/6c6Y8jNQNcBzmnTelibLy+V7xP7Pvaj5HECPUoTBNUYbkMNq9j1bDeeQC4mcg2o/2cNf3h
	ileT7W9xS0+MSXz2ONBn9TfqhVOV9R3xSI5XWkOvBIt4NsIK2Y6YI8jVulPPVkI2RT8dzcylq
	+ks7vz/wKLH1osyC2oG7EJBOfmy+CDzV1+wkwnD9elhP4/iyGxYuscBzvoyehRVGSsKFzQJ3T
	Ut3j3lgI0f1ysB32nH0TVjO6z2gJqNj2Inv6y7rRr+I8kmTRYnureyyxDsszF1IRG2WYDSaM7
	2wB0apq
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] Make yocto-spdx support spdx2.0 SPEC
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
X-List-Received-Date: Thu, 03 Nov 2016 09:11:14 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Lei, Maxin!

Where do we stand:=20
- v1 of patch submitted
- comment to create/use dosocs-native tp avoid the separate install (we=
ll, +1)
- comment that "the following direct dependencies that not belong to oe=
-core"

Did I summarize that correctly ?

@Maxin: what would you propose, work on the dependencies or let the use=
r=20
        install ?
@Lei: can you find where those dependencies are ?
      (https://layers.openembedded.org/layerindex/branch/morty/recipes/=
)

Best,
Jan-Simon

Am Donnerstag, 3. November 2016, 04:02:42 schrieb Lei, Maohui:
> Ping.
>=20
>=20
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-
 core-bounces@lists.openembedded.org] On Behalf Of
> > Lei, Maohui
> > Sent: Monday, October 17, 2016 9:04 AM
> > To: Maxin B. John; Jan-Simon M=F6ller
> > Cc: jsmoeller@linuxfoundation.org;
> > openembedded-core@lists.openembedded.org
 Subject: Re: [OE-core] [PATCH
> > v2 1/1] Make yocto-spdx support spdx2.0 SPEC=20
> > Hi Maxin, Simon
> >=20
> >=20
> > > > Instead of requesting the user to install the DoSOCSv2 from git=
hub
> > > > or other repos, can we make the spdx.bbclass depend on
> > > > "dosocs-native"
> > >=20
> > > or
> > >=20
> > > > similar and make that "DoSOCSv2" recipe available in oe-core ?
> > >
> > >
> > >
> > > That's a good idea. I will try.
> >=20
> >=20
> > I tried to make DoSOCSv2 recipe to oe-core, and find that there are=
 at
> > least
 the following direct dependencies that not belong to oe-core.
> >=20
> > PostgreSQL
> > python-psycopg2
> > jinja2
> > python-magic
> > docopt
> > SQLAlchemy
> > psycopg2
> >=20
> > I think it difficult to add them all into oe-core and it's the reas=
on that
> > why
 the original spdx module didn't add fossology into oe-core.
> >=20
> >=20
> >=20
> > Best regards
> > Lei
> >=20
> >=20
> >=20
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Beha=
lf Of
> > > Lei, Maohui
> > > Sent: Thursday, September 22, 2016 10:19 AM
> > > To: Maxin B. John; Jan-Simon M=F6ller
> > > Cc: jsmoeller@linuxfoundation.org; openembedded-
> > > core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH v2 1/1] Make yocto-spdx support spd=
x2.0
> > > SPEC
> > >
> > >
> > >
> > > Hi Maxin, Simon
> > >
> > >
> > >
> > > > It would be nice to include the reason for change from fossolog=
y to
> > > > dosocs2 in the commit message too (from cover letter)
> > >
> > >
> > >
> > > OK, I will add the reasons into the commit message in v3.
> > >
> > >
> > >
> > > > Instead of requesting the user to install the DoSOCSv2 from git=
hub
> > > > or other repos, can we make the spdx.bbclass depend on
> > > > "dosocs-native"
> > >=20
> > > or
> > >=20
> > > > similar and make that "DoSOCSv2" recipe available in oe-core ?
> > >
> > >
> > >
> > > That's a good idea. I will try.
> > >
> > >
> > >
> > >
> > > Best Regards
> > > Lei
> > >
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Maxin B. John [mailto:maxin.john@intel.com]
> > > > Sent: Monday, September 19, 2016 6:58 PM
> > > > To: Lei, Maohui
> > > > Cc: openembedded-core@lists.openembedded.org;
> > > > jsmoeller@linuxfoundation.org
> > > > Subject: Re: [OE-core] [PATCH v2 1/1] Make yocto-spdx support
> > > > spdx2.0 SPEC
> > > >
> > > >
> > > >
> > > > Hi,
> > > >
> > > >
> > > >
> > > > Please find my comments below:
> > > >
> > > >
> > > >
> > > > On Mon, Sep 19, 2016 at 04:39:50PM +0800, Lei Maohui wrote:
> > > >=20
> > > > > More:
> > > > > - change spdx tool from fossology to dosocs2
> > > >
> > > >
> > > >
> > > > It would be nice to include the reason for change from fossolog=
y to
> > > > dosocs2 in the commit message too (from cover letter)
> > > >
> > > >
> > > >
> > > > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > > > > ---
> > > > >=20
> > > > >  meta/classes/spdx.bbclass | 505
> > > > >=20
> > > > > ++++++++++++++++++------------------
> > > >=20
> > > > ----------
> > > >=20
> > > > >  meta/conf/licenses.conf   |  67 +-----
> > > > >  2 files changed, 198 insertions(+), 374 deletions(-)
> > > > >
> > > > >
> > > > >
> > > > > diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bb=
class
> > > > > index 0c92765..27c0fa0 100644
> > > > > --- a/meta/classes/spdx.bbclass
> > > > > +++ b/meta/classes/spdx.bbclass
> > > > > @@ -1,365 +1,252 @@
> > > > >=20
> > > > >  # This class integrates real-time license scanning, generati=
on of
> > > > >=20
> > > > > SPDX standard  # output and verifiying license info during th=
e
> > > >=20
> > > > building process.
> > > >=20
> > > > > -# It is a combination of efforts from the OE-Core, SPDX and
> > > >=20
> > > > Fossology projects.
> > > >=20
> > > > > +# It is a combination of efforts from the OE-Core, SPDX and
> > > > > +DoSOCSv2
> > > >=20
> > > > projects.
> > > >=20
> > > > >  #
> > > > >=20
> > > > > -# For more information on FOSSology:
> > > > > -#   http://www.fossology.org
> > > > > -#
> > > > > -# For more information on FOSSologySPDX commandline:
> > > > > -#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossol=
ogy-> > > >=20
> > > > SPDX-Web-API
> > > >=20
> > > > > +# For more information on DoSOCSv2:
> > > > > +#   https://github.com/DoSOCSv2
> > > >
> > > >
> > > >
> > > > Instead of requesting the user to install the DoSOCSv2 from git=
hub
> > > > or other repos, can we make the spdx.bbclass depend on
> > > > "dosocs-native"
> > >=20
> > > or
> > >=20
> > > > similar and make that "DoSOCSv2" recipe available in oe-core ?
> > > >
> > > >
> > > >
> > > > That might make it easy to use this class.
> > > >
> > > >
> > > >
> > > > >  # For more information on SPDX:
> > > > >  #   http://www.spdx.org
> > > > >  #
> > > > >=20
> > > > > +# Note:
> > > > > +# 1) Make sure DoSOCSv2 has beed installed in your host # 2)=
 By
> > > > > +default,spdx files will be output to the path which is defin=
ed
> > > >=20
> > > > as[SPDX_MANIFEST_DIR]
> > > >=20
> > > > > +#    in ./meta/conf/licenses.conf.
> > > > >
> > > > >
> > > > >
> > > > > -# SPDX file will be output to the path which is defined
> > > > > as[SPDX_MANIFEST_DIR] -# in ./meta/conf/licenses.conf.
> > > > > +SPDXOUTPUTDIR =3D "${WORKDIR}/spdx_output_dir"
> > > > >=20
> > > > >  SPDXSSTATEDIR =3D "${WORKDIR}/spdx_sstate_dir"
> > > > >
> > > > >
> > > > >
> > > > >  # If ${S} isn't actually the top-level source directory, set=

> > >=20
> > > SPDX_S
> > >=20
> > > > > to point at  # the real top-level directory.
> > > > > +
> > > > >=20
> > > > >  SPDX_S ?=3D "${S}"
> > > > >
> > > > >
> > > > >
> > > > >  python do_spdx () {
> > > > > =20
> > > > >      import os, sys
> > > > >=20
> > > > > -    import json, shutil
> > > > > -
> > > > > -    info =3D {}
> > > > > -    info['workdir'] =3D d.getVar('WORKDIR', True)
> > > > > -    info['sourcedir'] =3D d.getVar('SPDX_S', True)
> > > > > -    info['pn'] =3D d.getVar('PN', True)
> > > > > -    info['pv'] =3D d.getVar('PV', True)
> > > > > -    info['spdx_version'] =3D d.getVar('SPDX_VERSION', True)
> > > > > -    info['data_license'] =3D d.getVar('DATA_LICENSE', True)
> > > > > -
> > > > > -    sstatedir =3D d.getVar('SPDXSSTATEDIR', True)
> > > > > -    sstatefile =3D os.path.join(sstatedir, info['pn'] + info=
['pv'] +
> > > >=20
> > > > ".spdx")
> > > >=20
> > > > > +    import json
> > > > >
> > > > >
> > > > >
> > > > > -    manifest_dir =3D d.getVar('SPDX_MANIFEST_DIR', True)
> > > > > -    info['outfile'] =3D os.path.join(manifest_dir, info['pn'=
] +
> > > >=20
> > > > ".spdx" )
> > > >=20
> > > > > +    ## It's no necessary  to get spdx files for *-native
> > > > > +    if d.getVar('PN', True) =3D=3D d.getVar('BPN', True) + "=
-native":
> > > > > +        return None
> > > > >
> > > > >
> > > > >
> > > > > -    info['spdx_temp_dir'] =3D d.getVar('SPDX_TEMP_DIR', True=
)
> > > > > -    info['tar_file'] =3D os.path.join(info['workdir'], info[=
'pn'] +
> > > >=20
> > > > ".tar.gz" )
> > > >=20
> > > > > +    ## gcc is too big to get spdx file.
> > > > > +    if 'gcc' in d.getVar('PN', True):
> > > > > +        return None
> > > > >
> > > > >
> > > > >
> > > > > -    # Make sure important dirs exist
> > > > > -    try:
> > > > > -        bb.utils.mkdirhier(manifest_dir)
> > > > > -        bb.utils.mkdirhier(sstatedir)
> > > > > -        bb.utils.mkdirhier(info['spdx_temp_dir'])
> > > > > -    except OSError as e:
> > > > > -        bb.error("SPDX: Could not set up required directorie=
s: " +
> > > >=20
> > > > str(e))
> > > >=20
> > > > > -        return
> > > > > +    info =3D {}
> > > > > +    info['workdir'] =3D (d.getVar('WORKDIR', True) or "")
> > > > > +    info['pn'] =3D (d.getVar( 'PN', True ) or "")
> > > > > +    info['pv'] =3D (d.getVar( 'PV', True ) or "")
> > > > > +    info['package_download_location'] =3D (d.getVar( 'SRC_UR=
I',
> > > > > + True
> > > > > + )
> > > >=20
> > > > or "")
> > > >=20
> > > > > +    if info['package_download_location'] !=3D "":
> > > > > +        info['package_download_location'] =3D
> > > >=20
> > > > info['package_download_location'].split()[0]
> > > >=20
> > > > > +    info['spdx_version'] =3D (d.getVar('SPDX_VERSION', True)=
 or '')
> > > > > +    info['data_license'] =3D (d.getVar('DATA_LICENSE', True)=
 or '')
> > > > > +    info['creator'] =3D {}
> > > > > +    info['creator']['Tool'] =3D (d.getVar('CREATOR_TOOL', Tr=
ue) or
> > >=20
> > > '')
> > >=20
> > > > > +    info['license_list_version'] =3D
> > > > > + (d.getVar('LICENSELISTVERSION',
> > > >=20
> > > > True) or '')
> > > >=20
> > > > > +    info['package_homepage'] =3D (d.getVar('HOMEPAGE', True)=
 or "")
> > > > > +    info['package_summary'] =3D (d.getVar('SUMMARY', True) o=
r "")
> > > > > +    info['package_summary'] =3D
> > > >=20
> > > > info['package_summary'].replace("\n","")
> > > >=20
> > > > > +    info['package_summary'] =3D
> > >=20
> > > info['package_summary'].replace("'","
> > >=20
> > > > > + ")
> > > > > +
> > > > > +    spdx_sstate_dir =3D (d.getVar('SPDXSSTATEDIR', True) or =
"")
> > > > > +    manifest_dir =3D (d.getVar('SPDX_MANIFEST_DIR', True) or=
 "")
> > > > > +    info['outfile'] =3D os.path.join(manifest_dir, info['pn'=
] + "-"
> > >=20
> > > +
> > >=20
> > > > info['pv'] + ".spdx" )
> > > >=20
> > > > > +    sstatefile =3D os.path.join(spdx_sstate_dir,
> > > > > +        info['pn'] + "-" + info['pv'] + ".spdx" )
> > > > >
> > > > >
> > > > >
> > > > >      ## get everything from cache.  use it to decide if
> > > > >=20
> > > > > -    ## something needs to be rerun
> > > > > -    cur_ver_code =3D get_ver_code(info['sourcedir'])
> > > > > +    ## something needs to be rerun
> > > > > +    if not os.path.exists( spdx_sstate_dir ):
> > > > > +        bb.utils.mkdirhier( spdx_sstate_dir )
> > > > > +
> > > > > +    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
> > > > > +    info['sourcedir'] =3D (d.getVar('SPDX_S', True) or "")
> > > > > +    cur_ver_code =3D get_ver_code( info['sourcedir'] ).split=
()[0]
> > > > >=20
> > > > >      cache_cur =3D False
> > > > >=20
> > > > > -    if os.path.exists(sstatefile):
> > > > > +    if os.path.exists( sstatefile ):
> > > > >=20
> > > > >          ## cache for this package exists. read it in
> > > > >=20
> > > > > -        cached_spdx =3D get_cached_spdx(sstatefile)
> > > > > -
> > > > > -        if cached_spdx['PackageVerificationCode'] =3D=3D cur=
_ver_code:
> > > > > -            bb.warn("SPDX: Verification code for " + info['p=
n']
> > > > > -                  + "is same as cache's. do nothing")
> > > > > +        cached_spdx =3D get_cached_spdx( sstatefile )
> > > > > +        if cached_spdx:
> > > > > +            cached_spdx =3D cached_spdx.split()[0]
> > > > > +        if (cached_spdx =3D=3D cur_ver_code):
> > > > > +            bb.warn(info['pn'] + "'s ver code same as cache'=
s. do
> > > > > + nothing")
> > > > >=20
> > > > >              cache_cur =3D True
> > > > >=20
> > > > > +            create_manifest(info,sstatefile)
> > > > > +    if not cache_cur:
> > > > > +        ## setup dosocs2 command
> > > > > +        dosocs2_command =3D "dosocs2 oneshot %s" % info['sou=
rcedir']
> > > > > +        ## no necessary to scan the git directory.
> > > > > +        git_path =3D "%s/.git" % info['sourcedir']
> > > > > +        if os.path.exists(git_path):
> > > > > +            remove_dir_tree(git_path)
> > > > > +
> > > > > +        ## Get spdx file
> > > > > +        run_dosocs2(dosocs2_command,sstatefile)
> > > > > +        if get_cached_spdx( sstatefile ) !=3D None:
> > > > > +            write_cached_spdx( info,sstatefile,cur_ver_code =
)
> > > > > +            ## CREATE MANIFEST(write to outfile )
> > > > > +            create_manifest(info,sstatefile)
> > > > >=20
> > > > >          else:
> > > > >=20
> > > > > -            local_file_info =3D setup_foss_scan(info, True,
> > > >=20
> > > > cached_spdx['Files'])
> > > >=20
> > > > > -    else:
> > > > > -        local_file_info =3D setup_foss_scan(info, False, Non=
e)
> > > > > -
> > > > > -    if cache_cur:
> > > > > -        spdx_file_info =3D cached_spdx['Files']
> > > > > -        foss_package_info =3D cached_spdx['Package']
> > > > > -        foss_license_info =3D cached_spdx['Licenses']
> > > > > -    else:
> > > > > -        ## setup fossology command
> > > > > -        foss_server =3D d.getVar('FOSS_SERVER', True)
> > > > > -        foss_flags =3D d.getVar('FOSS_WGET_FLAGS', True)
> > > > > -        foss_full_spdx =3D d.getVar('FOSS_FULL_SPDX', True) =
=3D=3D
> > >=20
> > > "true"
> > >=20
> > > > or False
> > > >=20
> > > > > -        foss_command =3D "wget %s --post-file=3D%s %s"\
> > > > > -            % (foss_flags, info['tar_file'], foss_server)
> > > > > -
> > > > > -        foss_result =3D run_fossology(foss_command, foss_ful=
l_spdx)
> > > > > -        if foss_result is not None:
> > > > > -            (foss_package_info, foss_file_info, foss_license=
_info)
> > >=20
> > > =3D
> > >=20
> > > > foss_result
> > > >=20
> > > > > -            spdx_file_info =3D create_spdx_doc(local_file_in=
fo,
> > > >=20
> > > > foss_file_info)
> > > >=20
> > > > > -            ## write to cache
> > > > > -            write_cached_spdx(sstatefile, cur_ver_code,
> > > >=20
> > > > foss_package_info,
> > > >=20
> > > > > -                              spdx_file_info, foss_license_i=
nfo)
> > > > > -        else:
> > > > > -            bb.error("SPDX: Could not communicate with FOSSo=
logy
> > > >=20
> > > > server. Command was: " + foss_command)
> > > >=20
> > > > > -            return
> > > > > -
> > > > > -    ## Get document and package level information
> > > > > -    spdx_header_info =3D get_header_info(info, cur_ver_code,=

> > > >=20
> > > > foss_package_info)
> > > >=20
> > > > > +            bb.warn('Can\'t get the spdx file ' + info['pn']=
 + '.
> > > >=20
> > > > Please check your dosocs2.')
> > > >=20
> > > > > +    d.setVar('WORKDIR', info['workdir']) } ## Get the src af=
ter
> > > > > +do_patch.
> > > > > +python do_get_spdx_s() {
> > > > >
> > > > >
> > > > >
> > > > > -    ## CREATE MANIFEST
> > > > > -    create_manifest(info, spdx_header_info, spdx_file_info,
> > > >=20
> > > > foss_license_info)
> > > >=20
> > > > > +    ## It's no necessary  to get spdx files for *-native
> > > > > +    if d.getVar('PN', True) =3D=3D d.getVar('BPN', True) + "=
-native":
> > > > > +        return None
> > > > >
> > > > >
> > > > >
> > > > > -    ## clean up the temp stuff
> > > > > -    shutil.rmtree(info['spdx_temp_dir'], ignore_errors=3DTru=
e)
> > > > > -    if os.path.exists(info['tar_file']):
> > > > > -        remove_file(info['tar_file'])
> > > > > +    ## gcc is too big to get spdx file.
> > > > > +    if 'gcc' in d.getVar('PN', True):
> > > > > +        return None
> > > > > +
> > > > > +    ## Change the WORKDIR to make do_unpack do_patch run in
> > >=20
> > > another
> > >=20
> > > > dir.
> > > >=20
> > > > > +    d.setVar('WORKDIR', d.getVar('SPDX_TEMP_DIR', True))
> > > > > +    ## The changed 'WORKDIR' also casued 'B' changed, create=
 dir
> > >=20
> > > 'B'
> > >=20
> > > > for the
> > > >=20
> > > > > +    ## possibly requiring of the following tasks (such as so=
me
> > > >=20
> > > > recipes's
> > > >=20
> > > > > +    ## do_patch required 'B' existed).
> > > > > +    bb.utils.mkdirhier(d.getVar('B', True))
> > > > > +
> > > > > +    ## The kernel source is ready after do_validate_branches=

> > > > > +    if bb.data.inherits_class('kernel-yocto', d):
> > > > > +        bb.build.exec_func('do_unpack', d)
> > > > > +        bb.build.exec_func('do_kernel_checkout', d)
> > > > > +        bb.build.exec_func('do_validate_branches', d)
> > > > > +    else:
> > > > > +        bb.build.exec_func('do_unpack', d)
> > > > > +    ## The S of the gcc source is work-share
> > > > > +    flag =3D d.getVarFlag('do_unpack', 'stamp-base', True)
> > > > > +    if flag:
> > > > > +        d.setVar('S', d.getVar('WORKDIR', True) + "/gcc-" +
> > > >=20
> > > > d.getVar('PV', True))
> > > >=20
> > > > > +    bb.build.exec_func('do_patch', d)
> > > > >=20
> > > > >  }
> > > > >=20
> > > > > -addtask spdx after do_patch before do_configure
> > > > > -
> > > > > -def create_manifest(info, header, files, licenses):
> > > > > -    import codecs
> > > > > -    with codecs.open(info['outfile'], mode=3D'w', encoding=3D=
'utf-8')
> > >=20
> > > as
> > >=20
> > > > f:
> > > >=20
> > > > > -        # Write header
> > > > > -        f.write(header + '\n')
> > > > > -
> > > > > -        # Write file data
> > > > > -        for chksum, block in files.iteritems():
> > > > > -            f.write("FileName: " + block['FileName'] + '\n')=

> > > > > -            for key, value in block.iteritems():
> > > > > -                if not key =3D=3D 'FileName':
> > > > > -                    f.write(key + ": " + value + '\n')
> > > > > -            f.write('\n')
> > > > > -
> > > > > -        # Write license data
> > > > > -        for id, block in licenses.iteritems():
> > > > > -            f.write("LicenseID: " + id + '\n')
> > > > > -            for key, value in block.iteritems():
> > > > > -                f.write(key + ": " + value + '\n')
> > > > > -            f.write('\n')
> > > > > -
> > > > > -def get_cached_spdx(sstatefile):
> > > > > -    import json
> > > > > -    import codecs
> > > > > -    cached_spdx_info =3D {}
> > > > > -    with codecs.open(sstatefile, mode=3D'r', encoding=3D'utf=
-8') as f:
> > > > > -        try:
> > > > > -            cached_spdx_info =3D json.load(f)
> > > > > -        except ValueError as e:
> > > > > -            cached_spdx_info =3D None
> > > > > -    return cached_spdx_info
> > > > >
> > > > >
> > > > >
> > > > > -def write_cached_spdx(sstatefile, ver_code, package_info, fi=
les,
> > > >=20
> > > > license_info):
> > > >=20
> > > > > -    import json
> > > > > -    import codecs
> > > > > -    spdx_doc =3D {}
> > > > > -    spdx_doc['PackageVerificationCode'] =3D ver_code
> > > > > -    spdx_doc['Files'] =3D {}
> > > > > -    spdx_doc['Files'] =3D files
> > > > > -    spdx_doc['Package'] =3D {}
> > > > > -    spdx_doc['Package'] =3D package_info
> > > > > -    spdx_doc['Licenses'] =3D {}
> > > > > -    spdx_doc['Licenses'] =3D license_info
> > > > > -    with codecs.open(sstatefile, mode=3D'w', encoding=3D'utf=
-8') as f:
> > > > > -        f.write(json.dumps(spdx_doc))
> > > > > -
> > > > > -def setup_foss_scan(info, cache, cached_files):
> > > > > -    import errno, shutil
> > > > > -    import tarfile
> > > > > -    file_info =3D {}
> > > > > -    cache_dict =3D {}
> > > > > -
> > > > > -    for f_dir, f in list_files(info['sourcedir']):
> > > > > -        full_path =3D os.path.join(f_dir, f)
> > > > > -        abs_path =3D os.path.join(info['sourcedir'], full_pa=
th)
> > > > > -        dest_dir =3D os.path.join(info['spdx_temp_dir'], f_d=
ir)
> > > > > -        dest_path =3D os.path.join(info['spdx_temp_dir'], fu=
ll_path)
> > > > > -
> > > > > -        checksum =3D hash_file(abs_path)
> > > > > -        if not checksum is None:
> > > > > -            file_info[checksum] =3D {}
> > > > > -            ## retain cache information if it exists
> > > > > -            if cache and checksum in cached_files:
> > > > > -                file_info[checksum] =3D cached_files[checksu=
m]
> > > > > -            ## have the file included in what's sent to the
> > > >=20
> > > > FOSSology server
> > > >=20
> > > > > -            else:
> > > > > -                file_info[checksum]['FileName'] =3D full_pat=
h
> > > > > -                try:
> > > > > -                    bb.utils.mkdirhier(dest_dir)
> > > > > -                    shutil.copyfile(abs_path, dest_path)
> > > > > -                except OSError as e:
> > > > > -                    bb.warn("SPDX: mkdirhier failed: " + str=
(e))
> > > > > -                except shutil.Error as e:
> > > > > -                    bb.warn("SPDX: copyfile failed: " + str(=
e))
> > > > > -                except IOError as e:
> > > > > -                    bb.warn("SPDX: copyfile failed: " + str(=
e))
> > > > > -        else:
> > > > > -            bb.warn("SPDX: Could not get checksum for file: =
" + f)
> > > > > +addtask get_spdx_s after do_patch before do_configure addtas=
k
> > > > > +spdx after do_get_spdx_s before do_configure
> > > > > +
> > > > > +def create_manifest(info,sstatefile):
> > > > > +    import shutil
> > > > > +    shutil.copyfile(sstatefile,info['outfile'])
> > > > > +
> > > > > +def get_cached_spdx( sstatefile ):
> > > > > +    import subprocess
> > > > > +
> > > > > +    if not os.path.exists( sstatefile ):
> > > > > +        return None
> > > > >
> > > > >
> > > > >
> > > > > -    with tarfile.open(info['tar_file'], "w:gz") as tar:
> > > > > -        tar.add(info['spdx_temp_dir'],
> > > >=20
> > > > arcname=3Dos.path.basename(info['spdx_temp_dir']))
> > > >=20
> > > > > +    try:
> > > > > +        output =3D subprocess.check_output(['grep',
> > > >=20
> > > > "PackageVerificationCode", sstatefile])
> > > >=20
> > > > > +    except subprocess.CalledProcessError as e:
> > > > > +        bb.error("Index creation command '%s' failed with re=
turn
> > > >=20
> > > > code %d:\n%s" % (e.cmd, e.returncode, e.output))
> > > >=20
> > > > > +        return None
> > > > > +    cached_spdx_info=3Doutput.decode('utf-8').split(': ')
> > > > > +    return cached_spdx_info[1]
> > > > > +
> > > > > +## Add necessary information into spdx file def
> > > > > +write_cached_spdx( info,sstatefile, ver_code ):
> > > > > +    import subprocess
> > > > > +
> > > > > +    def sed_replace(dest_sed_cmd,key_word,replace_info):
> > > > > +        dest_sed_cmd =3D dest_sed_cmd + "-e 's#^" + key_word=
 + ".*#"
> > > > > + +
> > > >=20
> > > > \
> > > >=20
> > > > > +            key_word + replace_info + "#' "
> > > > > +        return dest_sed_cmd
> > > > > +
> > > > > +    def sed_insert(dest_sed_cmd,key_word,new_line):
> > > > > +        dest_sed_cmd =3D dest_sed_cmd + "-e '/^" + key_word =
\
> > > > > +            + r"/a\\" + new_line + "' "
> > > > > +        return dest_sed_cmd
> > > > > +
> > > > > +    ## Document level information
> > > > > +    sed_cmd =3D r"sed -i -e 's#\r$##g' "
> > > > > +    spdx_DocumentComment =3D "<text>SPDX for " + info['pn'] =
+ "
> > > >=20
> > > > version " \
> > > >=20
> > > > > +        + info['pv'] + "</text>"
> > > > > +    sed_cmd =3D
> > > > > + sed_replace(sed_cmd,"DocumentComment",spdx_DocumentComment)=

> > > > >
> > > > >
> > > > >
> > > > > -    return file_info
> > > > > +    ## Creator information
> > > > > +    sed_cmd =3D sed_insert(sed_cmd,"CreatorComment:
> > > > > + ","LicenseListVersion: " + info['license_list_version'])
> > > > > +
> > > > > +    ## Package level information
> > > > > +    sed_cmd =3D sed_replace(sed_cmd,"PackageName: ",info['pn=
'])
> > > > > +    sed_cmd =3D sed_replace(sed_cmd,"PackageVersion: ",info[=
'pv'])
> > > > > +    sed_cmd =3D sed_replace(sed_cmd,"PackageDownloadLocation=
:
> > > >=20
> > > > ",info['package_download_location'])
> > > >=20
> > > > > +    sed_cmd =3D sed_insert(sed_cmd,"PackageChecksum:
> > > >=20
> > > > ","PackageHomePage: " + info['package_homepage'])
> > > >=20
> > > > > +    sed_cmd =3D sed_replace(sed_cmd,"PackageSummary: ","<tex=
t>" +
> > > >=20
> > > > info['package_summary'] + "</text>")
> > > >=20
> > > > > +    sed_cmd =3D sed_replace(sed_cmd,"PackageVerificationCode=
:
> > > >=20
> > > > ",ver_code)
> > > >=20
> > > > > +    sed_cmd =3D sed_replace(sed_cmd,"PackageDescription: ",
> > > > > +        "<text>" + info['pn'] + " version " + info['pv'] +
> > >=20
> > > "</text>")
> > >=20
> > > > > +    sed_cmd =3D sed_cmd + sstatefile
> > > > > +
> > > > > +    subprocess.call("%s" % sed_cmd, shell=3DTrue)
> > > > > +
> > > > > +def remove_dir_tree( dir_name ):
> > > > > +    import shutil
> > > > > +    try:
> > > > > +        shutil.rmtree( dir_name )
> > > > > +    except:
> > > > > +        pass
> > > > >
> > > > >
> > > > >
> > > > > -def remove_file(file_name):
> > > > > +def remove_file( file_name ):
> > > > >=20
> > > > >      try:
> > > > >=20
> > > > > -        os.remove(file_name)
> > > > > +        os.remove( file_name )
> > > > >=20
> > > > >      except OSError as e:
> > > > >     =20
> > > > >          pass
> > > > >
> > > > >
> > > > >
> > > > > -def list_files(dir):
> > > > > -    for root, subFolders, files in os.walk(dir):
> > > > > +def list_files( dir ):
> > > > > +    for root, subFolders, files in os.walk( dir ):
> > > > >=20
> > > > >          for f in files:
> > > > >=20
> > > > > -            rel_root =3D os.path.relpath(root, dir)
> > > > > +            rel_root =3D os.path.relpath( root, dir )
> > > > >=20
> > > > >              yield rel_root, f
> > > > >     =20
> > > > >      return
> > > > >
> > > > >
> > > > >
> > > > > -def hash_file(file_name):
> > > > > +def hash_file( file_name ):
> > > > > +    """
> > > > > +    Return the hex string representation of the SHA1 checksu=
m of
> > > > > +the
> > > >=20
> > > > filename
> > > >=20
> > > > > +    """
> > > > >=20
> > > > >      try:
> > > > >=20
> > > > > -        with open(file_name, 'rb') as f:
> > > > > -            data_string =3D f.read()
> > > > > -            sha1 =3D hash_string(data_string)
> > > > > -            return sha1
> > > > > -    except:
> > > > > +        import hashlib
> > > > > +    except ImportError:
> > > > >=20
> > > > >          return None
> > > > >=20
> > > > > +
> > > > > +    sha1 =3D hashlib.sha1()
> > > > > +    with open( file_name, "rb" ) as f:
> > > > > +        for line in f:
> > > > > +            sha1.update(line)
> > > > > +    return sha1.hexdigest()
> > > > >
> > > > >
> > > > >
> > > > > -def hash_string(data):
> > > > > +def hash_string( data ):
> > > > >=20
> > > > >      import hashlib
> > > > >      sha1 =3D hashlib.sha1()
> > > > >=20
> > > > > -    sha1.update(data)
> > > > > +    sha1.update( data.encode('utf-8') )
> > > > >=20
> > > > >      return sha1.hexdigest()
> > > > >
> > > > >
> > > > >
> > > > > -def run_fossology(foss_command, full_spdx):
> > > > > +def run_dosocs2( dosocs2_command,  spdx_file ):
> > > > > +    import subprocess, codecs
> > > > >=20
> > > > >      import string, re
> > > > >=20
> > > > > -    import subprocess
> > > > > -
> > > > > -    p =3D subprocess.Popen(foss_command.split(),
> > > > > +
> > > > > +    p =3D subprocess.Popen(dosocs2_command.split(),
> > > > >=20
> > > > >          stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)
> > > > >=20
> > > > > -    foss_output, foss_error =3D p.communicate()
> > > > > +    dosocs2_output, dosocs2_error =3D p.communicate()
> > > > >=20
> > > > >      if p.returncode !=3D 0:
> > > > >     =20
> > > > >          return None
> > > > >
> > > > >
> > > > >
> > > > > -    foss_output =3D unicode(foss_output, "utf-8")
> > > > > -    foss_output =3D string.replace(foss_output, '\r', '')
> > > > > -
> > > > > -    # Package info
> > > > > -    package_info =3D {}
> > > > > -    if full_spdx:
> > > > > -        # All mandatory, only one occurrence
> > > > > -        package_info['PackageCopyrightText'] =3D
> > > >=20
> > > > re.findall('PackageCopyrightText: (.*?</text>)', foss_output,
> > > > re.S)[0]
> > > >=20
> > > > > -        package_info['PackageLicenseDeclared'] =3D
> > > >=20
> > > > re.findall('PackageLicenseDeclared: (.*)', foss_output)[0]
> > > >=20
> > > > > -        package_info['PackageLicenseConcluded'] =3D
> > > >=20
> > > > re.findall('PackageLicenseConcluded: (.*)', foss_output)[0]
> > > >=20
> > > > > -        # These may be more than one
> > > > > -        package_info['PackageLicenseInfoFromFiles'] =3D
> > > >=20
> > > > re.findall('PackageLicenseInfoFromFiles: (.*)', foss_output)
> > > >=20
> > > > > -    else:
> > > > > -        DEFAULT =3D "NOASSERTION"
> > > > > -        package_info['PackageCopyrightText'] =3D "<text>" + =
DEFAULT
> > >=20
> > > +
> > >=20
> > > > "</text>"
> > > >=20
> > > > > -        package_info['PackageLicenseDeclared'] =3D DEFAULT
> > > > > -        package_info['PackageLicenseConcluded'] =3D DEFAULT
> > > > > -        package_info['PackageLicenseInfoFromFiles'] =3D []
> > > > > -
> > > > > -    # File info
> > > > > -    file_info =3D {}
> > > > > -    records =3D []
> > > > > -    # FileName is also in PackageFileName, so we match on Fi=
leType
> > > >=20
> > > > as well.
> > > >=20
> > > > > -    records =3D re.findall('FileName:.*?FileType:.*?</text>'=
,
> > > >=20
> > > > foss_output, re.S)
> > > >=20
> > > > > -    for rec in records:
> > > > > -        chksum =3D re.findall('FileChecksum: SHA1: (.*)\n', =
rec)[0]
> > > > > -        file_info[chksum] =3D {}
> > > > > -        file_info[chksum]['FileCopyrightText'] =3D
> > > >=20
> > > > re.findall('FileCopyrightText: '
> > > >=20
> > > > > -            + '(.*?</text>)', rec, re.S )[0]
> > > > > -        fields =3D ['FileName', 'FileType', 'LicenseConclude=
d',
> > > >=20
> > > > 'LicenseInfoInFile']
> > > >=20
> > > > > -        for field in fields:
> > > > > -            file_info[chksum][field] =3D re.findall(field + =
':
> > > > > (.*)',
> > > >=20
> > > > rec)[0]
> > > >=20
> > > > > -
> > > > > -    # Licenses
> > > > > -    license_info =3D {}
> > > > > -    licenses =3D []
> > > > > -    licenses =3D re.findall('LicenseID:.*?LicenseName:.*?\n'=
,
> > > >=20
> > > > foss_output, re.S)
> > > >=20
> > > > > -    for lic in licenses:
> > > > > -        license_id =3D re.findall('LicenseID: (.*)\n', lic)[=
0]
> > > > > -        license_info[license_id] =3D {}
> > > > > -        license_info[license_id]['ExtractedText'] =3D
> > > >=20
> > > > re.findall('ExtractedText: (.*?</text>)', lic, re.S)[0]
> > > >=20
> > > > > -        license_info[license_id]['LicenseName'] =3D
> > > >=20
> > > > re.findall('LicenseName: (.*)', lic)[0]
> > > >=20
> > > > > -
> > > > > -    return (package_info, file_info, license_info)
> > > > > -
> > > > > -def create_spdx_doc(file_info, scanned_files):
> > > > > -    import json
> > > > > -    ## push foss changes back into cache
> > > > > -    for chksum, lic_info in scanned_files.iteritems():
> > > > > -        if chksum in file_info:
> > > > > -            file_info[chksum]['FileType'] =3D lic_info['File=
Type']
> > > > > -            file_info[chksum]['FileChecksum: SHA1'] =3D chks=
um
> > > > > -            file_info[chksum]['LicenseInfoInFile'] =3D
> > > >=20
> > > > lic_info['LicenseInfoInFile']
> > > >=20
> > > > > -            file_info[chksum]['LicenseConcluded'] =3D
> > > >=20
> > > > lic_info['LicenseConcluded']
> > > >=20
> > > > > -            file_info[chksum]['FileCopyrightText'] =3D
> > > >=20
> > > > lic_info['FileCopyrightText']
> > > >=20
> > > > > -        else:
> > > > > -            bb.warn("SPDX: " + lic_info['FileName'] + " : " =
+
> > >=20
> > > chksum
> > >=20
> > > > > -                + " : is not in the local file info: "
> > > > > -                + json.dumps(lic_info, indent=3D1))
> > > > > -    return file_info
> > > > > +    dosocs2_output =3D dosocs2_output.decode('utf-8')
> > > > > +
> > > > > +    f =3D codecs.open(spdx_file,'w','utf-8')
> > > > > +    f.write(dosocs2_output)
> > > > >
> > > > >
> > > > >
> > > > > -def get_ver_code(dirname):
> > > > > +def get_ver_code( dirname ):
> > > > >=20
> > > > >      chksums =3D []
> > > > >=20
> > > > > -    for f_dir, f in list_files(dirname):
> > > > > -        hash =3D hash_file(os.path.join(dirname, f_dir, f))
> > > > > -        if not hash is None:
> > > > > -            chksums.append(hash)
> > > > > -        else:
> > > > > -            bb.warn("SPDX: Could not hash file: " + path)
> > > > > -    ver_code_string =3D ''.join(chksums).lower()
> > > > > -    ver_code =3D hash_string(ver_code_string)
> > > > > +    for f_dir, f in list_files( dirname ):
> > > > > +        try:
> > > > > +            stats =3D os.stat(os.path.join(dirname,f_dir,f))=

> > > > > +        except OSError as e:
> > > > > +            bb.warn( "Stat failed" + str(e) + "\n")
> > > > > +            continue
> > > > > +        chksums.append(hash_file(os.path.join(dirname,f_dir,=
f)))
> > > > > +    ver_code_string =3D ''.join( chksums ).lower()
> > > > > +    ver_code =3D hash_string( ver_code_string )
> > > > >=20
> > > > >      return ver_code
> > > > >
> > > > >
> > > > >
> > > > > -def get_header_info(info, spdx_verification_code, package_in=
fo):
> > > > > -    """
> > > > > -        Put together the header SPDX information.
> > > > > -        Eventually this needs to become a lot less
> > > > > -        of a hardcoded thing.
> > > > > -    """
> > > > > -    from datetime import datetime
> > > > > -    import os
> > > > > -    head =3D []
> > > > > -    DEFAULT =3D "NOASSERTION"
> > > > > -
> > > > > -    package_checksum =3D hash_file(info['tar_file'])
> > > > > -    if package_checksum is None:
> > > > > -        package_checksum =3D DEFAULT
> > > > > -
> > > > > -    ## document level information
> > > > > -    head.append("## SPDX Document Information")
> > > > > -    head.append("SPDXVersion: " + info['spdx_version'])
> > > > > -    head.append("DataLicense: " + info['data_license'])
> > > > > -    head.append("DocumentComment: <text>SPDX for "
> > > > > -        + info['pn'] + " version " + info['pv'] + "</text>")=

> > > > > -    head.append("")
> > > > > -
> > > > > -    ## Creator information
> > > > > -    ## Note that this does not give time in UTC.
> > > > > -    now =3D datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
> > > > > -    head.append("## Creation Information")
> > > > > -    ## Tools are supposed to have a version, but FOSSology+S=
PDX
> > > >=20
> > > > provides none.
> > > >=20
> > > > > -    head.append("Creator: Tool: FOSSology+SPDX")
> > > > > -    head.append("Created: " + now)
> > > > > -    head.append("CreatorComment: <text>UNO</text>")
> > > > > -    head.append("")
> > > > > -
> > > > > -    ## package level information
> > > > > -    head.append("## Package Information")
> > > > > -    head.append("PackageName: " + info['pn'])
> > > > > -    head.append("PackageVersion: " + info['pv'])
> > > > > -    head.append("PackageFileName: " +
> > > >=20
> > > > os.path.basename(info['tar_file']))
> > > >=20
> > > > > -    head.append("PackageSupplier: Person:" + DEFAULT)
> > > > > -    head.append("PackageDownloadLocation: " + DEFAULT)
> > > > > -    head.append("PackageSummary: <text></text>")
> > > > > -    head.append("PackageOriginator: Person:" + DEFAULT)
> > > > > -    head.append("PackageChecksum: SHA1: " + package_checksum=
)
> > > > > -    head.append("PackageVerificationCode: " +
> > >=20
> > > spdx_verification_code)
> > >=20
> > > > > -    head.append("PackageDescription: <text>" + info['pn']
> > > > > -        + " version " + info['pv'] + "</text>")
> > > > > -    head.append("")
> > > > > -    head.append("PackageCopyrightText: "
> > > > > -        + package_info['PackageCopyrightText'])
> > > > > -    head.append("")
> > > > > -    head.append("PackageLicenseDeclared: "
> > > > > -        + package_info['PackageLicenseDeclared'])
> > > > > -    head.append("PackageLicenseConcluded: "
> > > > > -        + package_info['PackageLicenseConcluded'])
> > > > > -
> > > > > -    for licref in package_info['PackageLicenseInfoFromFiles'=
]:
> > > > > -        head.append("PackageLicenseInfoFromFiles: " + licref=
)
> > > > > -    head.append("")
> > > > > -
> > > > > -    ## header for file level
> > > > > -    head.append("## File Information")
> > > > > -    head.append("")
> > > > > -
> > > > > -    return '\n'.join(head)
> > > > > diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.con=
f
> > >=20
> > > index
> > >=20
> > > > > 9917c40..5963e2f 100644
> > > > > --- a/meta/conf/licenses.conf
> > > > > +++ b/meta/conf/licenses.conf
> > > > > @@ -122,68 +122,5 @@ SPDXLICENSEMAP[SGIv1] =3D "SGI-1"
> > > > >=20
> > > > >  #COPY_LIC_DIRS =3D "1"
> > > > >
> > > > >
> > > > >
> > > > >  ## SPDX temporary directory
> > > > >=20
> > > > > -SPDX_TEMP_DIR =3D "${WORKDIR}/spdx_temp"
> > > > > -SPDX_MANIFEST_DIR =3D "/home/yocto/fossology_scans"
> > > > > -
> > > > > -## SPDX Format info
> > > > > -SPDX_VERSION =3D "SPDX-1.1"
> > > > > -DATA_LICENSE =3D "CC0-1.0"
> > > > > -
> > > > > -## Fossology scan information
> > > > > -# You can set option to control if the copyright information=
 will
> > > > > be skipped -# during the identification process.
> > > > > -#
> > > > > -# It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.=
conf.
> > > > > -# FOSS_COPYRIGHT =3D "true"
> > > > > -#   NO copyright will be processed. That means only license
> > > >=20
> > > > information will be
> > > >=20
> > > > > -#   identified and output to SPDX file
> > > > > -# FOSS_COPYRIGHT =3D "false"
> > > > > -#   Copyright will be identified and output to SPDX file alo=
ng
> > >=20
> > > with
> > >=20
> > > > license
> > > >=20
> > > > > -#   information. The process will take more time than not
> > >=20
> > > processing
> > >=20
> > > > copyright
> > > >=20
> > > > > -#   information.
> > > > > -#
> > > > > -
> > > > > -FOSS_NO_COPYRIGHT =3D "true"
> > > > > -
> > > > > -# A option defined as[FOSS_RECURSIVE_UNPACK] in
> > > > > ./meta/conf/licenses.conf. is -# used to control if FOSSology=

> > >=20
> > > server
> > >=20
> > > > > need recursively unpack tar.gz file which -# is sent from do_=
spdx
> > > >=20
> > > > task.
> > > >=20
> > > > > -#
> > > > > -# FOSS_RECURSIVE_UNPACK =3D "false":
> > > > > -#    FOSSology server does NOT recursively unpack. In the cu=
rrent
> > > >=20
> > > > release, this
> > > >=20
> > > > > -#    is the default choice because recursively unpack will n=
ot
> > > >=20
> > > > necessarily break
> > > >=20
> > > > > -#    down original compressed files.
> > > > > -# FOSS_RECURSIVE_UNPACK =3D "true":
> > > > > -#    FOSSology server recursively unpack components.
> > > > > -#
> > > > > -
> > > > > -FOSS_RECURSIVE_UNPACK =3D "false"
> > > > > -
> > > > > -# An option defined as [FOSS_FULL_SPDX] in
> > > > > ./meta/conf/licenses.conf is used to -# control what kind of =
SPDX
> > > > > output to get from the
> > > >=20
> > > > FOSSology server.
> > > >=20
> > > > > -#
> > > > > -# FOSS_FULL_SPDX =3D "true":
> > > > > -#   Tell FOSSology server to return full SPDX output, like i=
f the
> > > >=20
> > > > program was
> > > >=20
> > > > > -#   run from the command line. This is needed in order to ge=
t
> > > >=20
> > > > license refs for
> > > >=20
> > > > > -#   the full package rather than individual files only.
> > > > > -#
> > > > > -# FOSS_FULL_SPDX =3D "false":
> > > > > -#   Tell FOSSology to only process license information for f=
iles.
> > > >=20
> > > > All package
> > > >=20
> > > > > -#   license tags in the report will be "NOASSERTION"
> > > > > -#
> > > > > -
> > > > > -FOSS_FULL_SPDX =3D "true"
> > > > > -
> > > > > -# FOSSologySPDX instance server. http://localhost/repo is th=
e
> > > >=20
> > > > default
> > > >=20
> > > > > -# installation location for FOSSology.
> > > > > -#
> > > > > -# For more information on FOSSologySPDX commandline:
> > > > > -#   https://github.com/spdx-tools/fossology-spdx/wiki/Fossol=
ogy-> > > >=20
> > > > SPDX-Web-API
> > > >=20
> > > > > -#
> > > > > -
> > > > > -FOSS_BASE_URL =3D "http://localhost/repo/?mod=3Dspdx_license=
_once"
> > > > > -FOSS_SERVER =3D
> > > >
> > > >
> > >=20
> > > "${FOSS_BASE_URL}&fullSPDXFlag=3D${FOSS_FULL_SPDX}&noCopyright=3D=
${FOSS_NO
> > >=20
> > > > _ COPYRIGHT}&recursiveUnpack=3D${FOSS_RECURSIVE_UNPACK}"
> > > >=20
> > > > > -
> > > > > -FOSS_WGET_FLAGS =3D "-qO - --no-check-certificate --timeout=3D=
0"
> > > > > -
> > > > > -
> > > > > +SPDX_TEMP_DIR ?=3D "${WORKDIR}/spdx_temp"
> > > > > +SPDX_MANIFEST_DIR ?=3D "/home/yocto/spdx_scans"
> > > >
> > > >
> > > >
> > > > Best Regards,
> > > > Maxin
> > > >
> > > >
> > >
> > >
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
> >=20
> >=20
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
--
Jan-Simon M=F6ller
dl9pf@gmx.de

