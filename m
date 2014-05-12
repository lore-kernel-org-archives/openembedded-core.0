Return-Path: <otavio.salvador@gmail.com>
X-Greylist: delayed 852 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 19:51:07 UTC
Received: from mail-yh0-f47.google.com (unknown [209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5510660702
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 19:51:07 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id z6so6342201yhz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0t7dAix4qm7+JctCvN30WgR3VeRVqFuvYGCtUg+butc=;
	b=uWyNRWPpMYmD4A0BPI+QMDlAaed+4Rte887noeJLWtMDnwxMNLCbjgDLfXe4SyrWuX
	xDoKDZBoL3YkybGAiHM+Ir7kzQcm4UfJPJ7mM9+zJUusikGmNK7UOizWKPihJJnA+pos
	DNZlFeVqJImbXErR5dT3Ff6cQWJXK3P/dtfW4GTP1lA/vpUbdaaMeoN+14bsV19N5zYw
	r3zrnAPL394jEk/u4YP+h8gff4gismHSEz7/ubUBBxNji2Rv1pJkUfTfrYjjqO3QbRra
	ko+T9fK9zbtMr3BDATnFtsGd4D1CgAwFtaZ2psBgLA1uy2FAgyi5Hj9y9X8/PPMhsrfs
	Rs9A==
MIME-Version: 1.0
X-Received: by 10.236.142.16 with SMTP id h16mr46694386yhj.2.1399922947107;
	Mon, 12 May 2014 12:29:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 12 May 2014 12:29:07 -0700 (PDT)
In-Reply-To: <53710BDA.10306@mentor.com>
References: <53710BDA.10306@mentor.com>
Date: Mon, 12 May 2014 16:29:07 -0300
X-Google-Sender-Auth: eZT8wpv_eITTKfUXoQ41COOPda4
Message-ID: <CAP9ODKp4FcOw7RMS1dnniv=TzrXkPkzNKkyLSwiAWf83ajtZKg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: meta-amd@yoctoproject.org, yocto <yocto@yoctoproject.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	yocto-bsp@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: New meta-amd mailing list announcement
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
X-List-Received-Date: Mon, 12 May 2014 19:51:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 12, 2014 at 2:58 PM, Sean Hudson <sean_hudson@mentor.com> wrote:
> There is a new mailing list for AMD platform/board related patches and
> discussion.
> You can sign up here: https://lists.yoctoproject.org/listinfo/meta-amd
>
> The meta-amd layer git repository is publicly available here:
> git://git.yoctoproject.org/meta-amd
> (cgit web interface here:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/)
>
> Please checkout the README at the top level for details on submitting
> patches.

What are the layer dependencies?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

