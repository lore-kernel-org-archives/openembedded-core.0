Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5C78360721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 12:16:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 21 Dec 2016 04:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,383,1477983600"; d="scan'208";a="914778538"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 21 Dec 2016 04:16:04 -0800
To: openembedded-core@lists.openembedded.org
References: <20161221070238.8554-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0e2947f3-9729-a463-3bb8-a11062749ac2@linux.intel.com>
Date: Wed, 21 Dec 2016 14:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161221070238.8554-1-raj.khem@gmail.com>
Subject: Re: [PATCH] gstreamer: Upgrade to 1.10.2
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
X-List-Received-Date: Wed, 21 Dec 2016 12:16:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2016 09:02 AM, Khem Raj wrote:
>  .../gstreamer/gstreamer1.0-omx_1.10.2.bb           | 10 +++++++

You should remove the file with previous version, so it becomes a file 
rename like the others.

Alex


