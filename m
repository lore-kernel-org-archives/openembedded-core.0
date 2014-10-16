Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id EEAF460DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 20:00:29 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id s7so2916584qap.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 13:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oF7wxPcmjMipgwH/mJqEDdWPbuc87Qo4SSUEBDRfL2Q=;
	b=aVGU+aWg/797bd3XF0C8plehxiI0t3+p1DHf0dLjo7I7HcOLbF39c5hPMow2llc6UU
	EYMOnUqz2qouEHCy6q/guHBiGfkdrRJjNpizMxZI2OCBpUjYl92vhvdgYDhqcIEGSyAS
	AAxWgzQm7VeUQw/+ZliSZVMZ/f11Iey8t3hmXUOuGRG37Yk33ZEqfnGQHLOUdf6/pkPH
	j4xnyVwn0FAkvai2wF25NbaHGZi/y8LtuuJK95Cv5JqmNboGKzEwy7kikHKV/a1CB2+5
	VJcse4iS9Bv9L1N1PPJoBkNqXvovIx6UD9qq1XH9RJsR2Dx1yyC2t9y9Z4XBzXcwbAKI
	AvSg==
X-Gm-Message-State: ALoCoQkQ9wVXkyY3jn3bK1gJs39YRgnpPrmsERwzyxharQJu4XpBW/dy2AzU+klQDhuFaWq948R4
X-Received: by 10.229.37.138 with SMTP id x10mr5674067qcd.5.1413489628512;
	Thu, 16 Oct 2014 13:00:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Thu, 16 Oct 2014 13:00:08 -0700 (PDT)
In-Reply-To: <543F33D5.9090102@windriver.com>
References: <1409294779-11573-1-git-send-email-Yue.Tao@windriver.com>
	<543F33D5.9090102@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Oct 2014 21:00:08 +0100
Message-ID: <CAJTo0LbD5oYO0m_QQwWNCNYDsbqu_dMZ0j9hCPpMZ3izDY=JxQ@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Yue Tao <Yue.Tao@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-4358
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
X-List-Received-Date: Thu, 16 Oct 2014 20:00:38 -0000
Content-Type: text/plain; charset=UTF-8

On 16 October 2014 03:56, Rongqing Li <rongqing.li@windriver.com> wrote:
> Ping, please merge these two CVE patches.

Sorry about that, thanks for the ping.

Ross

