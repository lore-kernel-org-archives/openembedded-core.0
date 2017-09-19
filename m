Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 85394780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:24:53 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 19 Sep 2017 04:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,418,1500966000"; d="scan'208";a="153540237"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2017 04:24:53 -0700
To: Trevor Woerner <twoerner@gmail.com>
References: <20170915142039.4855-1-alexander.kanavin@linux.intel.com>
	<bde8ed04-c337-e6ff-2ced-7997b64c6519@linux.intel.com>
	<CAHUNapQmRab5qoOYLiPbKapkunAfwkxUOak5PRw1bxYHvFTn_w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <77f7a9e9-0c3e-2b82-b9e9-a105625b29a2@linux.intel.com>
Date: Tue, 19 Sep 2017 14:20:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapQmRab5qoOYLiPbKapkunAfwkxUOak5PRw1bxYHvFTn_w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: use epoll API on Linux
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
X-List-Received-Date: Tue, 19 Sep 2017 11:24:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/16/2017 03:06 AM, Trevor Woerner wrote:
> So, my understand is that pseudo is looking for a new maintainer.
> Maybe that person has been found? ;-)
> 

If that person is me, then thank you for the trust, but:

a) I had no idea how pseudo works until last week; right now I'm 
familiar with maybe 3% of its code;

b) taking responsibility for these things is unfortunately something of 
a zero-sum game; my main area is maintenance of oe-core content, and 
with Jussi Kukkonen no longer involved in the project, I only expect 
more work, not less. Particularly around graphics, multimedia and 
gnome-related things.


Alex

