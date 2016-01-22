Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 224C7731D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:00:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 22 Jan 2016 05:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,331,1449561600"; d="scan'208";a="639357920"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2016 05:00:45 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56A22767.7050000@linux.intel.com>
Date: Fri, 22 Jan 2016 14:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
Subject: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 13:00:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

DirectFB upstream project has been dead for several months, the website 
has completely disappeared, and no explanation or apology has ever 
surfaced. [1]

So let's keep DirectFB in the forthcoming release, but drop it early in 
the next release cycle.

[1] http://www.phoronix.com/scan.php?page=news_item&px=DirectFB-Is-It-Gone



Alex

