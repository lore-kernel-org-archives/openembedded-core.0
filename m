Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 889F37306B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 22:53:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 27 Mar 2017 15:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,234,1486454400"; d="scan'208";a="1147653404"
Received: from dalin-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.23])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2017 15:53:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 28 Mar 2017 11:53:28 +1300
Message-ID: <18181743.RMn13RZB2O@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170327125359.16788-2-alexander.kanavin@linux.intel.com>
References: <20170327125359.16788-1-alexander.kanavin@linux.intel.com>
	<20170327125359.16788-2-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 2/2] dnf: move the entire dnf/rpm4 stack to Python 3
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
X-List-Received-Date: Mon, 27 Mar 2017 22:53:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Tuesday, 28 March 2017 1:53:59 AM NZDT Alexander Kanavin wrote:
> [YOCTO #11180]
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---

If you're doing another rev can you please have a reasonable commit message in 
here? Even if it's trivial.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

