Return-Path: <riku.voipio@linaro.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B34246FF9D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 09:01:31 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id p65so98734007wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 01:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:date:message-id:subject:from:to;
	bh=J8GL5ugV3a3f+suuUgm12jzHGrzyZeyJb6bCCsm2kCY=;
	b=XQkgFQRvVvkzgE+zcKyGsUSpV/j22NS+R7ey836Z+uCgwwiktoF/hIobRCX1J0K7zO
	UzCYwmb+KSdFwjDCh/Fb+/57eGFWrhgJuz1osf0PmYaq1yrd7ZC4ikzR3oqTw4Yg9/Vo
	LzlSQJudeZAXHJPqX0ON5/pxvYJrHam6R6+EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=J8GL5ugV3a3f+suuUgm12jzHGrzyZeyJb6bCCsm2kCY=;
	b=SEq9NK2IpAPU6cYrzJswjrBFFFXRpWCCGmAI83qULpnEkZ7IgIR7cXwHL7dxCbYvmt
	hr7evwfwkvci+fqPcE9fjHMBE3rljq45Q23CqySn/EVpqMeLA//2Rdlq523K15wu8dq0
	UnjhPxewrpZPrYM9EpqEc7Jjyd1+ffMO4ncsF2HnzhivAA/tsi6DHF3W2nHOjZtzk0bj
	Lw+r2Le7q2zFPtaQ6uazyMJmpK0JOMsDayR3T7AZ7JCCr/1ISptS/s52g737nnGsLA/8
	qiFtVMN5CqgF3oHjRSKcVNLkRS5niLHkCu+8XWPLVscQZBosXsxwdw1zW7RroyABw1f1
	D5Qg==
X-Gm-Message-State: AD7BkJKk5OsqvhKBh1bx4EPIKzIoBqZUOqeEWv/nCLw+IXR2xFfxCsbAXQfK+fn+5wqJhdOFhGHg+k3S895erohI
MIME-Version: 1.0
X-Received: by 10.194.188.20 with SMTP id fw20mr25090167wjc.80.1457341291655; 
	Mon, 07 Mar 2016 01:01:31 -0800 (PST)
Received: by 10.28.213.203 with HTTP; Mon, 7 Mar 2016 01:01:31 -0800 (PST)
Date: Mon, 7 Mar 2016 11:01:31 +0200
Message-ID: <CAAqcGHnzBmcYb+nD7d7b+YjqgLo=zMZRfQBGQJYR4T0ay9psTA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: Cross Distro Mailman List <cross-distro@lists.linaro.org>,
	debian-arm@lists.debian.org, arm@lists.fedoraproject.org, arm@gentoo.org, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, opensuse-arm@opensuse.org
Subject: Cross-distribution ARM meetings at Linaro connect this weel
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
X-List-Received-Date: Mon, 07 Mar 2016 09:01:32 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

We have a few sessions at this Linaro connect that could be in
interest of Linux distributions working on Arm/Linux:

Tuesday 14.00 Bangkok time: (07.00 UTC):
https://bkk16.pathable.com/meetings/372827 BKK16-212: What's broken on ARM64?
Thursday 10.10 Bangkok time: (03.00 UTC):
https://bkk16.pathable.com/meetings/372890 BKK16-402: Cross distro BoF
Friday 10.10 Bangkok time: (03.00 UTC):
https://bkk16.pathable.com/meetings/372923 BKK16-501: Kernel
Consolidation and Other Short Stories

Talks are being live-streamed (thou there were problems today..) and
recorded in case time happens to be inconvenient in your timezones.

If you have anything specific in your mind, feel free to reply to this mail to
cross-distribution list, and I'll get it added to the agenda slides.

Cheers,
Riku

