Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DC94960118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:34:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2016 06:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="943414426"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2016 06:34:24 -0700
To: openembedded-core@lists.openembedded.org
References: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56F29A68.5030905@linux.intel.com>
Date: Wed, 23 Mar 2016 15:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
Subject: Python 3 as oe-core default?
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
X-List-Received-Date: Wed, 23 Mar 2016 13:34:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2016 10:55 PM, Ross Burton wrote:
> Ideally this would be an option but that means conditional inherits.  For now
> Python 2 is clearly the default Python in oe-core so switch to Python 2 instead
> of 3.

Shall we start the work towards making 3 the default though?

Alex


