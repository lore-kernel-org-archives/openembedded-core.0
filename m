Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id C4D2C60197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 10:39:57 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42kB1n73JRz1rTS0;
	Mon, 29 Oct 2018 11:39:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42kB1n6ndDz1qrJJ;
	Mon, 29 Oct 2018 11:39:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id H5TVUABGAXfU; Mon, 29 Oct 2018 11:39:55 +0100 (CET)
X-Auth-Info: 4Mffxs8UbGGKU7j5+qhDgw4R0USHOaP7F1euW6hV9rM7PAACh7amHDRDPGoaS+A3
Received: from [10.0.0.72] (host-141-40-253-35.customer.izb-online.de
	[141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 29 Oct 2018 11:39:55 +0100 (CET)
To: Dan McGregor <danismostlikely@gmail.com>
References: <20181019152214.1600-1-o.mandel@menlosystems.com>
	<CACS+7ZTTdXs4WuMqBede2KPrsxWu-By1CvZ8t8SvLzRUU-Z6RA@mail.gmail.com>
From: Olaf Mandel <o.mandel@menlosystems.com>
Openpgp: preference=signencrypt
Autocrypt: addr=o.mandel@menlosystems.com; prefer-encrypt=mutual; keydata=
	xsBNBE9PiqUBCADe0zPq1vIfZFtlkWvV6SYOFo5awT3UejHCmplCUZ55UNW4RV0xXUudDjZs
	kDRYE8u0YaYCIdx2iwpeSSrmTNWgmGyLJHHfmHlsG0OZBLM1nY/NvVEa2R/sgLgzybSRuzNF
	QFxAfOIoZ9+5ygQMQNoOjDdvzrMVqWXSA9O/6rZAv4OMiHY2EnCDnCyBZ+/gI86i/gasY/j6
	J9yX8N08f3yHQ9iAUZbnroWu0DN1B1W7md0omf8Y5xEhsav4BBQGYUoHRg4KCFkRiqB4ypjm
	CTs/2+JMpyQJi3dSBRlEXNWpdtg3r6+Dp3GIg7eoZ7klCRMblhy2k4VVoLiieVV+lx9RABEB
	AAHNJ09sYWYgTWFuZGVsIDxvLm1hbmRlbEBtZW5sb3N5c3RlbXMuY29tPsLAeAQTAQIAIgUC
	T0+KpQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQVL2dtGJSHf8/rQf/Qs1mVz7F
	r2RwMlbiEa6cEE+ciCt0UTlPXfsF1mHG0/XZoHCOMq14VBuQFcOW9N5c7L05cCuz2tFhbk2+
	LELBnFi9kFZZpi/rpHHbCiTXIM0JXZUmRtNoRoWVZzP9WTKD2BtNc6694bDFEVizK58oivG1
	c1yLmdQeKgJ291inC7x4g+dR/BgBzrgt01iTUjY4s5boXQyySaexg1ME0AyJN/2A+SMxx0SY
	bvOwfOZUurpnX9iO9IXbeHp2cPLRdgfuWqoqdTeOo1K6DleZqgucYBPfEcAzwGbkrlvFFznh
	MWQ1EUkFrolT7TfBKsASnGBRP30+OpMCE74tDOXbP7MwE87ATQRPT4qlAQgA7IoG9IFn8RGr
	x7W5mUhIYVuk1C0ovxzTyKn6kFhSql/V5I92J0pTyN76caqGavNwommnv1S4CB7DXS9ukfg7
	9be8lwT3NQQDRQGsHyPK8ysxQoFVZzo6eHS6oUUXY9Rb66tKmihj22rO96+x46EJ4XJRDTs6
	8NaOEM9PPSe64LmILK/VvAFIBIrlAHhJ2Ldhf0hRU5bQz3doNNo34iUEohaXFj0vP9eZkPIM
	UzS1AKsJ/+3iqzM+14iP0NZRUe+Yb6nW8187gwJBnqBpw8/uT7ioCyM+h1ukXMAbm2+vhHMT
	YzPmYFMfrN4vy3xX2hcq94X6pRM/wRi6mxlJ7Tf4xQARAQABwsBfBBgBAgAJBQJPT4qlAhsM
	AAoJEFS9nbRiUh3/CmwIAIG+eSJ6SU5H75B6Ud9bGenTx5VOqWUQaDPFaxOMUoUI/uSf9vRI
	DQo3vXcn3vDxFuup00BN30L7cKjDU35kuWyhMFA6a/mM1ilHyPlFCv4u0RjZ2S9CWt0l/dy4
	QmZTKZ0Yrxeo6HZOLIvQwvDy8ThZRYdEz0mL9rMM+JXAVraUjqovMGE+8FkmMxmwxcFSLLQK
	0hEZiKLYhJ5DkAtHkkJBNAWpPSx0QJUfZX3fSCDmVOfkI2JitqARhpy9MO6D1Z3gr1hz6fCt
	XspCPlrvsRGRVFzAMfvXGSQOnikwGTtElzrDplsIxo0SpijaPUF/Up0KN65BpBnBchlEnaxU
	0Oc=
Message-ID: <6d4e8838-01fc-1452-0676-e6657b428fca@menlosystems.com>
Date: Mon, 29 Oct 2018 11:39:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACS+7ZTTdXs4WuMqBede2KPrsxWu-By1CvZ8t8SvLzRUU-Z6RA@mail.gmail.com>
Cc: marex@denx.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] npm: change install directory to upstream default
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
X-List-Received-Date: Mon, 29 Oct 2018 10:39:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Dan,

Am 26.10.2018 um 19:46 schrieb Dan McGregor:
> On Fri, 19 Oct 2018 at 09:29, Olaf Mandel
> <o.mandel@menlosystems.com> wrote:
>> -NPM_INSTALLDIR = "${D}${libdir}/node_modules/${NPMPN}" 
>> +NPM_INSTALLDIR = "${D}${libdir}/node/${NPMPN}"
> 
> Ï realise this has already gone în, but should this be 
> ${nonarch_libdir}, or does it use /usr/lib64 or /usr/libx32
> correctly?
> 
For me, libdir resolves to /usr/lib, so I didn't notice any problems.
And the "lib"-part is hardcoded in NodeJS (lib/module.js:
path.resolve(prefixDir, 'lib', 'node')).

So if ${nonarch_libdir} is always ${prefix}/lib even if ${libdir}
isn't, then that should be changed.

Best regards,
Olaf Mandel
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEErGOsr28GGMKRE/TmVL2dtGJSHf8FAlvW43UACgkQVL2dtGJS
Hf8gLAf/aIQ5z219f1Tqtp5Oc1mBr4IN3T/Uzk6MlKKtqfQGS2KBF7CqWLUKNXT2
/eKa/v7H55yTWC6PSlJjx7HMzJK9mhwZ84LwAQ4rpj6ZBn1RYjv4DBdgPxlQN+1N
4kAoWklpgBut0eNtb9hniwf2VhF7rkI8eLVdNcL1SR7JroDahSnjVGozuE/asxK0
yJHHaz3cbe6QooYKeyi4y6lM1wJfP5Wny0rOCMh3rWvsexf7G7itki0MoRU7dNVv
C2zK+/KVjhYbLWSRijSYjGRFpMzKb9AddBxkpIZ4z7vjAlbbbYN1iw3RdPoiPYhP
rwvtSk3Wwe4McsVUjRaEFxwcdCPQQQ==
=1BcQ
-----END PGP SIGNATURE-----

