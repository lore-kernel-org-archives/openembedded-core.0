Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A76A61577
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:01:36 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so3003947vbg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vaq5GV8gvYR+S6S3G2JRKNkhLX5ooqtqy8rFfjainsU=;
	b=lNU3Z6QrhVDXx4GUXPVGZoRs5+y8a+DAeihFufqFfAaN1anmt+/sbDh6j04yqPgdMs
	n/TPGrSrMTHvlwNRBlQt2f+C16MqRpNg6KP9DL/A+XrKL6IvaDubC+6JUP4u106oJ1uk
	NxJS0SqX/3N8qFkDwKnM3rT2pWT5NAydMH9ZQ75PX2pE7LLjkkel2ePtiS2AIpXZXhsD
	h+sBACugc6QFw1CflnAHoyDqvUpdk+DwcsCu3/GXDCBQ7AycN1nzWmAxn3c/I4LfMw44
	QAa+HCOXbi+QS/0NtfPnafeng5Gts6ecT7L9kVaEK+xAbZC1swVzYgmc+J1sPZnQJ1fg
	bXhw==
X-Gm-Message-State: ALoCoQlduCsqr4xhWe9FSkyw8Dj2B4TPDLRiBm74gHjQydcj+Irn2wrQLRbHPPC+yCmwPsU2AqQB
X-Received: by 10.52.34.40 with SMTP id w8mr23141173vdi.7.1379343696468; Mon,
	16 Sep 2013 08:01:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 08:01:16 -0700 (PDT)
In-Reply-To: <CAJTo0LZucKPx8oG-v+JghEwQmcXhu5qz36bie_sgB9tWoN2tfw@mail.gmail.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70495CFD@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LZucKPx8oG-v+JghEwQmcXhu5qz36bie_sgB9tWoN2tfw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 16:01:16 +0100
Message-ID: <CAJTo0La044A1SHOwLWkgM=koHn=Ont46SNJ5ddSS2XMn6hocAQ@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 16 Sep 2013 15:01:37 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2013 16:00, Burton, Ross <ross.burton@intel.com> wrote:
> The change to separatebuilddir.inc seems wrong

Can't read diffs, thanks for the fix. ;)

Ross

