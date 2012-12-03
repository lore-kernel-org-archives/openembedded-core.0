Received: from mail-ia0-f177.google.com ([209.85.210.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TfPIk-0006ol-VT
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 07:14:54 +0100
Received: by mail-ia0-f177.google.com with SMTP id u21so2372599ial.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 22:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RXX/whgObr1kR94b4s8ablcxFCWLvyevBrnyXIsefYs=;
	b=Q7gxtcWdSWbDmYuFhQviPHioZMb/JxUZiEVRxtaBZ36Dka1/0/aC/78Y8ER40b9lck
	05ORyvYg2FMUtBbTSuUmFe6BUpF7pqG2sduuGmfXf5x7Dvti2IXfMbvcitpmOJk+z1RG
	ca2htueBjHY6z+qjgxoGxNUEG+vHpkYnVrHd45Mto51g2QHbLE/Kc96aVj5jYr1kU0pn
	j8awb2Yd84BOyyRe2z+UcZY4sUi1TLXS4zvKiCdYoXWmnn0y2ZZOitx2jIUorJKUOFJw
	AOG+MwsAyd5RV1SoeUWTcOfEssYpRUcm5AcHTUNwwFKLWBFYt2L31G/IlDWfICYUwmiW
	h7JA==
Received: by 10.50.178.67 with SMTP id cw3mr5045900igc.53.1354514425623; Sun,
	02 Dec 2012 22:00:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Sun, 2 Dec 2012 21:59:55 -0800 (PST)
In-Reply-To: <7327098.TAKnqlOXbO@helios>
References: <59c6eb39edcf9308a81c9ad84f248e30e526f6ba.1354480962.git.raj.khem@gmail.com>
	<8db2a8dab66febf2844ac62cd207e9e40edec11c.1354480962.git.raj.khem@gmail.com>
	<7327098.TAKnqlOXbO@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Dec 2012 21:59:55 -0800
Message-ID: <CAMKF1srR1jMHR-SfJF+-mjFpmfkP8Qa4=8rCiS9Ex1zACBsz-Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libcgroup: Fix QA error about .so symlink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 06:14:58 -0000
Content-Type: multipart/alternative; boundary=e89a8f6438962eb31e04cfec7720

--e89a8f6438962eb31e04cfec7720
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 2, 2012 at 3:26 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> FWIW, Martin already sent this patch.


OK as long as it gets fixed.

--e89a8f6438962eb31e04cfec7720
Content-Type: text/html; charset=UTF-8

<div class="gmail_extra"><br><br><div class="gmail_quote">On Sun, Dec 2, 2012 at 3:26 PM, Paul Eggleton <span dir="ltr">&lt;<a href="mailto:paul.eggleton@linux.intel.com" target="_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">FWIW, Martin already sent this patch.</blockquote></div><br>OK as long as it gets fixed.<br></div>

--e89a8f6438962eb31e04cfec7720--
