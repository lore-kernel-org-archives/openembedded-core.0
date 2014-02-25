Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 977CD6E7D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 05:54:26 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id rd18so4485733iec.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 21:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=x8lj+IlJFII2PPaMRuxWJRcNn3LtNzwBhgiencjFsYk=;
	b=dJHb8l4ij+VS+WUJaPdtr8bi7LtlVMUIOvLbk8/7Fc0/uo3BfEboJplvhDLUS0hDoX
	MbawKbbWCKzCLDH+8Hgg7ii4iMqSOo44z2sHH5EVdHwYpO1a1/KLJsOqNAZu3pvCb6UY
	tw6YBDT9OCymWUPJmvdKDXRreFmcIkgi9Ou7PaWPPBsLXqmK0j68k8KpPlgpgETkWJYm
	/wUvr0sfFWPyBCDRwTr4q1x63kePpEF70dwowSTRnfQGr8FZ4ROtAX2hbdxIDBiATlFj
	V4SRcIYqhw4v54UWFnfqZgtUP71vyrU2FANPhNJdCBbROyEKoHL5ySunJhnBuHDbJbIt
	H5XA==
X-Received: by 10.50.124.193 with SMTP id mk1mr17590345igb.17.1393307667152;
	Mon, 24 Feb 2014 21:54:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 24 Feb 2014 21:53:57 -0800 (PST)
In-Reply-To: <19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com> <5014991.yOqVctVWSl@helios>
	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2014 21:53:57 -0800
Message-ID: <CAMKF1spJLrQw1iT3MyNRCeW7VX34urjEW=xeNTHiK_w=cX1odg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Tue, 25 Feb 2014 05:54:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 24, 2014 at 8:38 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> So, has anyone got any better ideas for the name of core-image-basic and
> packagegroup-core-basic?
>

baselinux maybe

