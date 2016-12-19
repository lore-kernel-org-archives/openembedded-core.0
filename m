Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 50697771F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 12:48:14 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 19 Dec 2016 04:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="41481048"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 19 Dec 2016 04:48:14 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1482127585.git.dengke.du@windriver.com>
	<1d8d15e8fd9c4c9c1eeb6f13e5b069df6d995dce.1482127585.git.dengke.du@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <21713566-e80c-78fe-6525-38e327ada14e@linux.intel.com>
Date: Mon, 19 Dec 2016 14:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1d8d15e8fd9c4c9c1eeb6f13e5b069df6d995dce.1482127585.git.dengke.du@windriver.com>
Subject: Re: [PATCH 1/1] cdrtools-native: update 3.01 -> 3.02
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
X-List-Received-Date: Mon, 19 Dec 2016 12:48:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/2016 08:07 AM, Dengke Du wrote:
> 3.01a31 -> 3.02a07

This is incorrect. We actually ship the final 3.01 version, and 
previously agreed to wait for the final 3.02. The recipe says 'a31' 
because we didn't want to make the version go back when going from alpha 
3.01 to final 3.01. The upstream seems to make regular 3.02 
pre-releases, so the final version should hopefully appear soon.

Alex


