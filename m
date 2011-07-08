Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfDNM-0002CU-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:53:56 +0200
Received: by bwf20 with SMTP id 20so2159795bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3nUZrPNsiV2jkVoqmSEezBuEp5VMea+rQ2bEysVguvU=;
	b=YsHc8UV86fisxUioabas2hGcyab6qHLS2bT+miW1OSTShgkF+do8U/lE1d2Vfco96W
	zHvoKv33/RDI6FwTydD+VOCt4HBt3Wv6cH94d4wdM/tlkpMcnvVbvzrpt3w/K7gKARSZ
	k/ByrGRF5vmGSWipiVBjldzlfoET5W6JG06uM=
MIME-Version: 1.0
Received: by 10.204.144.197 with SMTP id a5mr407269bkv.281.1310140203332; Fri,
	08 Jul 2011 08:50:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.120.75 with HTTP; Fri, 8 Jul 2011 08:50:03 -0700 (PDT)
In-Reply-To: <1310138840.20015.881.camel@rex>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<b81093b9840677dd5c63bbed58ebfe2150791504.1310132765.git.otavio@ossystems.com.br>
	<1310138840.20015.881.camel@rex>
Date: Fri, 8 Jul 2011 12:50:03 -0300
X-Google-Sender-Auth: x7M8uCHxifuAGSRxwBqkKIzfQ0A
Message-ID: <CAP9ODKpg3jMB=PbSgmPqSsuJTz78k5wBVHOwb0-7Yc4SgfrY6w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] libarchive: add 2.8.4 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 15:53:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 12:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
>> This recipe has been imported from OpenEmbedded (rev
>> 6db4b9050e0e8b963e2a6b63790e48e3042ea99e).
>
> The piece of data I don't have here is the reason we need this OE-Core?

cmake uses it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


