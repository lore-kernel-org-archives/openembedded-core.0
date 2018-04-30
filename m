Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 49B7A60069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:04:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Apr 2018 06:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,346,1520924400"; d="scan'208";a="47154554"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 30 Apr 2018 06:04:33 -0700
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1524640773.git.kai.kang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d33b20e6-d156-6610-1e12-aac3b0932959@linux.intel.com>
Date: Mon, 30 Apr 2018 15:58:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1524640773.git.kai.kang@windriver.com>
Subject: Re: [PATCH v2 0/8] gstreamer1.0: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Mon, 30 Apr 2018 13:04:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 10:23 AM, kai.kang@windriver.com wrote:

>    gstreamer1.0: 1.12.4 -> 1.14.0
>    gstreamer1.0-plugins-base: 1.12.4 -> 1.14.0
>    gstreamer1.0-plugins-bad: 1.12.4 -> 1.14.0
>    gstreamer1.0-plugins-ugly: 1.12.4 -> 1.14.0
>    gstreamer1.0-plugins-good: 1.12.4 -> 1.14.0
>    gstreamer1.0-libav: 1.12.4 -> 1.14.0
>    gst-validate: 1.12.4 -> 1.14.0
>    gstreamer1.0: upgrade other packages to 1.14.0

Are you aware if they plan to drop autotools and provide only meson 
builds, and when?

Alex

