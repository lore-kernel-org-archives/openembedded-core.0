Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id C31E36B478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 20:14:52 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so7831874oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jjMPyfRHg4yf/70VT3SQC7lCRHksJTxggum5d3e3wSM=;
	b=pnMxLy2E/Efir3ZafVpty+hu2Pbzob2HVU2NQveLJUgd52nMjQhMyY+X52uJm0wYUf
	1Eaxt/HNQ+2x6QlOO27niNvvo+gtPPnScAjdkhXVH147l8N/fxnRKVAy2wbC3VuInagp
	AHrXQjWe3JH/1MopMSklW8OCxS2ALfbrL5vXejCqKHwJf2le2s/VT30rC9UXa2BlAUvd
	mwM/t5pIQbmJ3obVL8QfSHVRMNoyye0ifOGDyEXpQV1/rqjXgH6uG3YNsV72gHKK3Pke
	YJTnbZOuTfmE5AGca4ivna+kSNkzS9aOAYznbqmXO8b6PtccexIVLqIrRjJI3Kwy6TQQ
	ZRCA==
MIME-Version: 1.0
X-Received: by 10.182.27.74 with SMTP id r10mr58161832obg.63.1375215292843;
	Tue, 30 Jul 2013 13:14:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.125.199 with HTTP; Tue, 30 Jul 2013 13:14:52 -0700 (PDT)
In-Reply-To: <6204851.hDiY3UGMop@atv-pwoegere-l3.atv.mentorg.com>
References: <4903846.j6lpffeJue@atv-pwoegere-l3.atv.mentorg.com>
	<CAP9ODKqt4ZkPsr8bzHqekb7NxRypF75tgbmiqg7aJTVEreD0Sw@mail.gmail.com>
	<6204851.hDiY3UGMop@atv-pwoegere-l3.atv.mentorg.com>
Date: Tue, 30 Jul 2013 17:14:52 -0300
X-Google-Sender-Auth: jPaJ7858fwAczqtGCLYl6iUcViA
Message-ID: <CAP9ODKqABwY=qvbAjRrFToaG4e+yw7Pm1WYPxMoaRYdB9i0sjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: lttng-* 2.2.x point release updates
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
X-List-Received-Date: Tue, 30 Jul 2013 20:14:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 5:09 PM,  <Paul_Woegerer@mentor.com> wrote:
> Hi Otavio,

Hi Paul,

> The patch below updates LTTng and related packages to the latest point releases.

Thanks by working on this but please send one patch for each recipe
and follow the process documented at:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Thanks in advance :-)

Best regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

