Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A6B0D78DC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:24:27 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w6VAOQAH012330
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 31 Jul 2018 12:24:27 +0200
Received: from [192.168.253.100] ([163.242.57.90])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id w6VAOQdC013428;
	Tue, 31 Jul 2018 12:24:26 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1533000487-12738-1-git-send-email-armccurdy@gmail.com>
	<b9a00beb06723da9bdd5f32923057d31ccbc0941.camel@linuxfoundation.org>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	xsBNBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAHNJ0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPsLAfgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO587ATQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABwsBlBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <b5b31110-b182-fc03-e648-bd5d90f025ef@siemens.com>
Date: Tue, 31 Jul 2018 12:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b9a00beb06723da9bdd5f32923057d31ccbc0941.camel@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl_1.0: drop unnecessary dependency on makedepend-native
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
X-List-Received-Date: Tue, 31 Jul 2018 10:24:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

This program is required for "oe_runmake depend" command. It runs
command in MAKEDEPPROG variable, which is set to makedepend. Makedepend
consists from makedepend-native package.

Cheers,
Andrej

On 07/31/18 12:08, Richard Purdie wrote:
> On Mon, 2018-07-30 at 18:28 -0700, Andre McCurdy wrote:
>> The openssl Configure script will only select standalone makedepend
>> (vs running "$CC -M") when building with gcc < 3.x or with an Apple
>> Xcode version which predates the switch to clang (in approx 2010?).
>> Neither of these cases are possible when building under OE, therefore
>> the dependency on makedepend-native can be dropped (ie align the
>> openssl 1.0 recipe with the 1.1 recipe, which has dropped the
>> makedepend-native dependency already).
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> index f5d3274..78c8552 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> @@ -8,7 +8,7 @@ SECTION = "libs/network"
>>  LICENSE = "openssl"
>>  LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
>>  
>> -DEPENDS = "makedepend-native hostperl-runtime-native"
>> +DEPENDS = "hostperl-runtime-native"
>>  DEPENDS_append_class-target = " openssl-native"
>>  
>>  PROVIDES += "openssl10"
> 
> This was added quite 'recently' in:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=50c23e6c26a64b0c04e99abacb61ec00d1abace9
> 
> I've cc'd Andrej in case he can tell us why that was needed?
> 
> Cheers,
> 
> Richard
> 

