Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB37271B23
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 12:25:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2016 04:25:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="14848001"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 07 Dec 2016 04:25:26 -0800
To: openembedded-core@lists.openembedded.org
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5106886a-56c8-79f3-bd7a-aee780fd590b@linux.intel.com>
Date: Wed, 7 Dec 2016 14:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 00/33] Accumulated patches for deb packaging
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
X-List-Received-Date: Wed, 07 Dec 2016 12:25:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2016 01:49 PM, Andreas Oberritter wrote:
> These are most of my patches which accumulated since our distro
> switched from opkg to dpkg and apt two years ago. They were tested
> thoroughly on dora and krogoth and just a little bit on master.

How about updating apt and dpkg to latest upstream releases at the same 
time?

Alex


