Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQBM6-0000NQ-Ga
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 07:47:02 +0200
Received: by laai10 with SMTP id i10so1083223laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pqbe63Or2GXok+CddTlCWY/JNPLhsFstU7vU1mvHVg4=;
	b=0yr29fnHjf4GZuhMVfMqzPCw9ONwd/bRPaiGfuh1G/o3PbXLkZL/erFvbA4NHTsssU
	aLf5vLLD1E7u96zBxQz0+5RpMVATcY9QlLejSTCDp+uJtUDlmiyazT/3wRYuXCa+i+bB
	OiFLvjwfp5+SWQn6onBrQZrzEQONqe+xWuikk+h8OErBvgDypt/P0nN/U7cVWPPYKn5v
	e6pppIHZrb63CzlZcaxeGug6Z4FSAsU3Y85tJk09umpLp0a4ZOz9vCeu0f4K7WXH0Trq
	cvhdnGI5h8CHcwhkr1DpyA4yrcEiX62bh18/7PIkf5DepRNCNYqGZI7mxrUqBAY1kCUf
	ZGAw==
Received: by 10.112.32.72 with SMTP id g8mr2242878lbi.43.1336109836182; Thu,
	03 May 2012 22:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 22:36:45 -0700 (PDT)
In-Reply-To: <20120504053258.GA3163@jama.jama.net>
References: <cover.1335992192.git.raj.khem@gmail.com>
	<907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
	<4FA327A2.5040705@linux.intel.com>
	<20120504053258.GA3163@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 22:36:45 -0700
Message-ID: <CAMKF1so6z8fLDsaLT7f+oBLB90zWvJm0Reaf97wf7ECGSdzw5Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] kmod: Add recipes
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
X-List-Received-Date: Fri, 04 May 2012 05:47:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 10:32 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Not sure why khem haven't used this commit/patch.

because my build machine has xsltproc installed. I will cherry pick this patch


