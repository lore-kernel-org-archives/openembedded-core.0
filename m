Return-Path: <paul.eggleton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5E07A299;
	Mon,  1 Oct 2018 04:15:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Sep 2018 21:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,326,1534834800"; d="scan'208";a="90996326"
Received: from lgprasad-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.175.84])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2018 21:15:02 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Mon, 01 Oct 2018 17:14:59 +1300
Message-ID: <3113534.rOdZyxEQgT@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <300c15ce-48f1-dde7-c231-b604b38d0922@windriver.com>
References: <1721109.tuLG3TFsTU@localhost.localdomain>
	<d8427b2a-b63f-e19c-1fc7-6cb365dc63ff@windriver.com>
	<300c15ce-48f1-dde7-c231-b604b38d0922@windriver.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] layers.openembedded.org upgraded
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
X-List-Received-Date: Mon, 01 Oct 2018 04:15:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, 30 September 2018 6:40:30 AM NZDT Randy MacLeod wrote:
> It works for me now but it's not clear why. It seems that
> it was a problem with my firefox profile.
> 
> Work log below in case it might help someone else.
> 
> ../Randy
> 
> 
> I rebooted:
>    - still no menu.
> I logged out and then into another account on the same laptop:
>    - it worked.
> I created another firefox profile in my usual account:
>    - it worked.
> I deleted that profile and used my default profile:
>    - still no menu.
> While visiting layers.openembedded.org, I opened the firefox
> console using Shift+Control+K
>    - I re-loaded the site.
>    - it worked!
> I closed the console:
>    - it worked!
> I restarted firefox:
>    - it still works!

Thanks - I'm also still puzzled by this, but I guess it's good that it 
apparently fixed itself. If the issue returns or anyone else sees anything 
strange like this happening then please let me know.

Cheers
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre



