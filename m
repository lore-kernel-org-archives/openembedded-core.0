Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AFC8B71AB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 10:19:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2017 03:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,218,1488873600"; d="scan'208";a="91162974"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 18 Apr 2017 03:19:06 -0700
To: openembedded-core@lists.openembedded.org
References: <1491876119-195521-1-git-send-email-dengke.du@windriver.com>
	<2f2ca19a-5af9-aa71-23bc-c2d30ea43445@windriver.com>
	<1492411399.19076.58.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <067fa2dd-24ee-60bc-4a27-ddf886d66408@linux.intel.com>
Date: Tue, 18 Apr 2017 13:18:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1492411399.19076.58.camel@linuxfoundation.org>
Subject: Re: [PATCH] openssh: upgrade to 7.5p1
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
X-List-Received-Date: Tue, 18 Apr 2017 10:19:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2017 09:43 AM, Richard Purdie wrote:
> On Mon, 2017-04-17 at 12:37 +0800, Dengke Du wrote:
>> Ping.
>
> We do not take upgrades after feature freeze when we're stabilising
> unless there is a pressing reason to do so. Your commit messages makes
> no mention of any pressing reason.

Yes, but... people keep doing it despite you and me and everyone else 
telling them not to. How about someone would stash those updates to a 
kind of 'master-next-next' branch, and dump them to the list again when 
the merge window reopens? I can do that, if I would get a clear 
indication of when that work should start and finish.

Alex


