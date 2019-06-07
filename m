Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Jun 2019 08:52:02 UTC
Received: from 7.mo69.mail-out.ovh.net (7.mo69.mail-out.ovh.net [46.105.50.32])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA027E3B1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 08:52:02 +0000 (UTC)
Received: from player168.ha.ovh.net (unknown [10.108.42.83])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 9F9A05D486
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 10:45:56 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id BAB3167F88DB;
	Fri,  7 Jun 2019 08:45:53 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1559892984-24780-1-git-send-email-maciej.pijanowski@3mdeb.com>
	<CAJTo0Lb=azHFW1Cpg-FP4nbLnnNaL9KMu0FHUpHQcMh+Sr2R2Q@mail.gmail.com>
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Openpgp: preference=signencrypt
Autocrypt: addr=maciej.pijanowski@3mdeb.com; keydata=
	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
	0f2bcrTp9w==
Message-ID: <29e27537-a8c0-a832-8813-5e46b75bd4f0@3mdeb.com>
Date: Fri, 7 Jun 2019 10:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb=azHFW1Cpg-FP4nbLnnNaL9KMu0FHUpHQcMh+Sr2R2Q@mail.gmail.com>
X-Ovh-Tracer-Id: 2613213687612845772
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudegiedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: piotr.krol@3mdeb.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipetool: support python3 instead of python2
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
X-List-Received-Date: Fri, 07 Jun 2019 08:52:02 -0000
X-Groupsio-MsgNum: 125476
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="s2TvILtfdJ93HjVaxxjO2dOZrXVQsFmbK"

--s2TvILtfdJ93HjVaxxjO2dOZrXVQsFmbK
Content-Type: multipart/mixed; boundary="262Sb0DQDR2DmUKlh63sS0tXD3J1DYI3H";
 protected-headers="v1"
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, piotr.krol@3mdeb.com
Message-ID: <29e27537-a8c0-a832-8813-5e46b75bd4f0@3mdeb.com>
Subject: Re: [OE-core] [PATCH] recipetool: support python3 instead of python2
References: <1559892984-24780-1-git-send-email-maciej.pijanowski@3mdeb.com>
 <CAJTo0Lb=azHFW1Cpg-FP4nbLnnNaL9KMu0FHUpHQcMh+Sr2R2Q@mail.gmail.com>
In-Reply-To: <CAJTo0Lb=azHFW1Cpg-FP4nbLnnNaL9KMu0FHUpHQcMh+Sr2R2Q@mail.gmail.com>

--262Sb0DQDR2DmUKlh63sS0tXD3J1DYI3H
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 07.06.2019 10:35, Burton, Ross wrote:
> My first thought was "won't this break the test" but then I discovered
> that there's no test.
>
> Would you be able to write a small test for this, along the lines of
> test_recipetool_create_*() in
> meta/lib/oeqa/selftest/cases/recipetool.py?
Sure, I will try that. I haven't been contributing to the QA parts yet.
Is there any documentation / guidelines I should refer to?
Or looking at other test cases should be enough to get it done?
>
> Ross
>
> On Fri, 7 Jun 2019 at 08:56, Maciej Pijanowski
> <maciej.pijanowski@3mdeb.com> wrote:
>> Add support for generating python3 recipes using the recipetool / devt=
ool.
>> Drop python2 support at the same time.
>>
>> Tested with:
>>
>> devtool add --also-native python3-python-magic \
>> https://files.pythonhosted.org/packages/84/30/\
>>   80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/\
>>   python-magic-0.4.15.tar.gz
>>
>> No python2 dependencies were pulled in
>>
>> Fixes Bug 13264
>>
>> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>> ---
>>  scripts/lib/recipetool/create_buildsys_python.py | 22 +++++++++++----=
-------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/script=
s/lib/recipetool/create_buildsys_python.py
>> index ec5449bee99f..f24dce23918a 100644
>> --- a/scripts/lib/recipetool/create_buildsys_python.py
>> +++ b/scripts/lib/recipetool/create_buildsys_python.py
>> @@ -41,11 +41,11 @@ def tinfoil_init(instance):
>>
>>
>>  class PythonRecipeHandler(RecipeHandler):
>> -    base_pkgdeps =3D ['python-core']
>> -    excluded_pkgdeps =3D ['python-dbg']
>> -    # os.path is provided by python-core
>> +    base_pkgdeps =3D ['python3-core']
>> +    excluded_pkgdeps =3D ['python3-dbg']
>> +    # os.path is provided by python3-core
>>      assume_provided =3D ['builtins', 'os.path']
>> -    # Assumes that the host python builtin_module_names is sane for t=
arget too
>> +    # Assumes that the host python3 builtin_module_names is sane for =
target too
>>      assume_provided =3D assume_provided + list(sys.builtin_module_nam=
es)
>>
>>      bbvar_map =3D {
>> @@ -225,9 +225,9 @@ class PythonRecipeHandler(RecipeHandler):
>>          self.apply_info_replacements(info)
>>
>>          if uses_setuptools:
>> -            classes.append('setuptools')
>> +            classes.append('setuptools3')
>>          else:
>> -            classes.append('distutils')
>> +            classes.append('distutils3')
>>
>>          if license_str:
>>              for i, line in enumerate(lines_before):
>> @@ -292,7 +292,7 @@ class PythonRecipeHandler(RecipeHandler):
>>                  for feature, feature_reqs in extras_req.items():
>>                      unmapped_deps.difference_update(feature_reqs)
>>
>> -                    feature_req_deps =3D ('python-' + r.replace('.', =
'-').lower() for r in sorted(feature_reqs))
>> +                    feature_req_deps =3D ('python3-' + r.replace('.',=
 '-').lower() for r in sorted(feature_reqs))
>>                      lines_after.append('PACKAGECONFIG[{}] =3D ",,,{}"=
'.format(feature.lower(), ' '.join(feature_req_deps)))
>>
>>          inst_reqs =3D set()
>> @@ -303,7 +303,7 @@ class PythonRecipeHandler(RecipeHandler):
>>              if inst_reqs:
>>                  unmapped_deps.difference_update(inst_reqs)
>>
>> -                inst_req_deps =3D ('python-' + r.replace('.', '-').lo=
wer() for r in sorted(inst_reqs))
>> +                inst_req_deps =3D ('python3-' + r.replace('.', '-').l=
ower() for r in sorted(inst_reqs))
>>                  lines_after.append('# WARNING: the following rdepends=
 are from setuptools install_requires. These')
>>                  lines_after.append('# upstream names may not correspo=
nd exactly to bitbake package names.')
>>                  lines_after.append('RDEPENDS_${{PN}} +=3D "{}"'.forma=
t(' '.join(inst_req_deps)))
>> @@ -364,7 +364,7 @@ class PythonRecipeHandler(RecipeHandler):
>>          return info, 'setuptools' in imported_modules, non_literals, =
extensions
>>
>>      def get_setup_args_info(self, setupscript=3D'./setup.py'):
>> -        cmd =3D ['python', setupscript]
>> +        cmd =3D ['python3', setupscript]
>>          info =3D {}
>>          keys =3D set(self.bbvar_map.keys())
>>          keys |=3D set(self.setuparg_list_fields)
>> @@ -398,7 +398,7 @@ class PythonRecipeHandler(RecipeHandler):
>>      def get_setup_byline(self, fields, setupscript=3D'./setup.py'):
>>          info =3D {}
>>
>> -        cmd =3D ['python', setupscript]
>> +        cmd =3D ['python3', setupscript]
>>          cmd.extend('--' + self.setuparg_map.get(f, f.lower()) for f i=
n fields)
>>          try:
>>              info_lines =3D self.run_command(cmd, cwd=3Dos.path.dirnam=
e(setupscript)).splitlines()
>> @@ -535,7 +535,7 @@ class PythonRecipeHandler(RecipeHandler):
>>          pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR')
>>
>>          ldata =3D tinfoil.config_data.createCopy()
>> -        bb.parse.handle('classes/python-dir.bbclass', ldata, True)
>> +        bb.parse.handle('classes/python3-dir.bbclass', ldata, True)
>>          python_sitedir =3D ldata.getVar('PYTHON_SITEPACKAGES_DIR')
>>
>>          dynload_dir =3D os.path.join(os.path.dirname(python_sitedir),=
 'lib-dynload')
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Maciej Pijanowski
Embedded Systems Engineer
https://3mdeb.com | @3mdeb_com



--262Sb0DQDR2DmUKlh63sS0tXD3J1DYI3H--

--s2TvILtfdJ93HjVaxxjO2dOZrXVQsFmbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJc+iRAAAoJEPFAHS4cyxnv9kkP/12/sUmcyqs0R8IjKvKJaB2I
UpVySWAN0lEjVOMF96/5Dxggd/fXzbDBuoih/6KO6k26IpSRqrQm1yZDT4H/l9dB
oDPo0ErTKzDhGSnMVEkpa5RPlFTzYJvtF4ZOVGCfWFU9/D+n2y4bhoFhyn+izGTo
Bjr9yEwzhyTAK3xOzoBcwkLbUuQt55lQ8HIcxqBEM6WqLy9ldZQP8u+8ZGh/kEe/
MnW8ZEKTf1BO2IWQovJGioigKyaVDvVzarLMNCJQYwQQVg7VDzIKjZ6V0ScLYV2G
TLY70F72sQPWO8PNpj4OCebwN4BK1HRZArZU0ASimSdMwwhFHVsS2gVM3J/Fw+j5
zMT/iENFdNpNUzgRlV7j2n42VBWb85mYNIkNLtlpZPdsTgg1fvjkiBzlchu1o11f
iRJbDVwo9s8W/7SV/JJ6fa+PPoO0LYYSVeKlCRRWYPAwjSfIMYabv5wDeNulOblE
v2SVVcjnfSCAa+oRF7ICA/Hj0EYYW0o/gIrTKJM61T7XS0MFpPBektAXFeGnxRMj
aw12E49bzq00P+u/4iQjQRaS3La3vsg9AYwPkJl+RCd+pXZBG1gbS7W4PVsf7E/B
0I3RtrTSgxyZwOrkNVVtY7ihleFHExGhDLguU/PsYUdfkDlLImnCcUQfZY0Tp+mM
VYOouAOrZYputEXqG4o2
=tGgb
-----END PGP SIGNATURE-----

--s2TvILtfdJ93HjVaxxjO2dOZrXVQsFmbK--
