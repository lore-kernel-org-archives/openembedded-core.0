Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <4a5680ae26aee355966a67362c03d558124a4310.camel@linuxfoundation.org>
Subject: Re: [OE-core] Typo in comment (was: tool to list source files)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 18 Feb 2022 17:54:36 +0000
In-Reply-To: <67a1e2bb-bc0b-7540-5a76-fd6e1107955e@linux.ibm.com>
References: 
	<303c5e534acf18e74f7a80bf43a9a07127d9fed9.camel@linuxfoundation.org>
	 <67a1e2bb-bc0b-7540-5a76-fd6e1107955e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, OE-core <openembedded-core@lists.openembedded.org>

On Thu, 2022-02-17 at 17:39 -0600, Joseph Reynolds wrote:
> There seems to a typo in a comment in archiver.bbclass; ARCHIVE_MODE 
> should be ARCHIVER_MODE for "mirror" (letter R is missing).
> 
> https://github.com/openembedded/openembedded-core/blob/master/meta/classes/archiver.bbclass#L8
> 
> Joseph
> 
> P.S. The archiver class is awesome.  Thank you!
> 

I fixed that typo, thanks for reporting.

Cheers,

Richard

