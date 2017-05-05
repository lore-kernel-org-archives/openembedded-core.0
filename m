Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 642A177D55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 14:15:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 05 May 2017 07:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="1144087935"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2017 07:15:20 -0700
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
References: <20170505141027.8381-1-alexander.kanavin@linux.intel.com>
	<20170505141027.8381-4-alexander.kanavin@linux.intel.com>
	<CANx9H-AschSQrSgpiHQh-OPsTKDt-MeQ0Jm5sUOO_OH1iRrHWg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a18d1bc1-d016-0c9f-a993-7c8bfd3c987e@linux.intel.com>
Date: Fri, 5 May 2017 17:15:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-AschSQrSgpiHQh-OPsTKDt-MeQ0Jm5sUOO_OH1iRrHWg@mail.gmail.com>
Subject: Re: [PATCHv2 4/6] recipes-lsb4/perl: remove the recipes
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
X-List-Received-Date: Fri, 05 May 2017 14:15:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2017 05:13 PM, Tim Orling wrote:
> Should we move them to meta-perl?

Up to you; I generally don't move things unless there's specific 
evidence that things will get broken otherwise.

Alex


