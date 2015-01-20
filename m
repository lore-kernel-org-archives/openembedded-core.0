Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 55B6C71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:13:47 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id F3991F811EE; Tue, 20 Jan 2015 09:13:42 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 74F5DF811DC;
	Tue, 20 Jan 2015 09:13:42 -0700 (MST)
Message-ID: <54BE7EC4.2080000@mlbassoc.com>
Date: Tue, 20 Jan 2015 09:13:56 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1421677219-27316-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaKbxT+9p=Er9wQvy_4Agd9R6vCoCJKaTdx+qH2vwhWqg@mail.gmail.com>
In-Reply-To: <CAJTo0LaKbxT+9p=Er9wQvy_4Agd9R6vCoCJKaTdx+qH2vwhWqg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: Backport fix for bug #123591
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
X-List-Received-Date: Tue, 20 Jan 2015 16:14:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-01-20 08:49, Burton, Ross wrote:
>
> On 19 January 2015 at 14:20, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     @@ -0,0 +1,21 @@
>     +Upstream-Status: Backport
>     +Reference: https://rt.perl.org/Public/Bug/Display.html?id=123591
>
>
> This needs to be Signed-off-by.

By whom?  There is no Signed-off-by in the perl commit.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

