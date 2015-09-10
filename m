Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id B4B0873243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:14:37 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1B803F811F2; Thu, 10 Sep 2015 06:14:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 783D8F811F2;
	Thu, 10 Sep 2015 06:14:37 -0600 (MDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com> <55F16E82.1070708@gmail.com>
	<55F172C9.3030601@linux.intel.com> <55F173AC.7010808@mlbassoc.com>
	<CAJTo0LYWxFtoYNseSup-zXAvJMigP_y1c4wdSrFXwk6SP_C-=A@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <55F17470.6000304@mlbassoc.com>
Date: Thu, 10 Sep 2015 06:15:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYWxFtoYNseSup-zXAvJMigP_y1c4wdSrFXwk6SP_C-=A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 12:14:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-10 06:12, Burton, Ross wrote:
>
> On 10 September 2015 at 13:12, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     What would you do to the poor sod that sends a patch upstream
>     (i.e. Pending) that is not being moved on by the upstream holders?
>     Punish him by making his patch (and potentially all others he
>     has created) invalid?  Seems a bit harsh...
>
>
> Send upstream is Upstream-Status: Submitted.
>
> Pending means "I wrote a patch but cannot be bothered to send it upstream".

Fair enough, that's a different case which does seem to warrant this treatment.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

