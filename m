Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0416D8A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 18:32:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jan 2014 10:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,654,1384329600"; d="scan'208";a="438159070"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga001.jf.intel.com with ESMTP; 13 Jan 2014 10:32:14 -0800
Message-ID: <52D4312E.6030005@linux.intel.com>
Date: Mon, 13 Jan 2014 10:32:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>, 
	oe-core <openembedded-core@lists.openembedded.org>
References: <1389617286.9182.181.camel@phil-desktop.brightsign>
In-Reply-To: <1389617286.9182.181.camel@phil-desktop.brightsign>
Subject: Re: [oe-commits] Upgrade Helper : base-passwd: upgrade to 3.5.29
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
X-List-Received-Date: Mon, 13 Jan 2014 18:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2014 04:48 AM, Phil Blundell wrote:
> The new version introduced by this patch doesn't seem to actually exist
> at the SRC_URI.  (ftp.debian.org currently has 3.5.28, 3.5.30 and 3.5.31
> but not 3.5.29.)
>
Seems they did a quick succession of updates and removed the .29 
version. I am working on the .31 update

> Also, as far as I can tell, this patch wasn't ever posted to the list
> for review and the alleged author's email address of "uh@not.set"
> doesn't sound entirely plausible.
>
My mistake, I did the update built it locally and it was included as 
part of a MUT / C-Pull.

Sau!


>
>
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 7c79e70d3a803f2ccb9b9c6ed2134019631672fd
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=7c79e70d3a803f2ccb9b9c6ed2134019631672fd
>>
>> Author: Upgrade Helper <uh at not.set>
>> Date:   Sat Jan  4 11:44:14 2014 +0200
>>
>> base-passwd: upgrade to 3.5.29
>>
>> Signed-off-by: Saul Wold <sgw at linux.intel.com>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

