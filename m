Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9096059A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 10:40:10 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q107so12924398qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 03:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q8LeUlZyTVMrFRmghxMX9WiuDL4vCu1CiQOY5TS8OL4=;
	b=cf0Yw6UwXTPa0PTyBb8FeBBzS3UNiAjv6wiRqjJEOjwfO4rsfnWg7eyphCWrI/bGN6
	3ldZdLpyrqsQl8eiI/OjhExfeTiqBq/l7rRcL47NkKYK5TPjmKsLdXvb5mQEq4NDHlNv
	AhcQR3fv3v/7y1KZBZmoIrc+NfGc1KUxdNg8VsPqsTTSVbCA81nbMOSQDAoxc31aIVz6
	X/0KgN1eRAXt6IkS0KOYn6ZQcrxAiCtK9Ar/B6gGHKK6aqHU2xqT/nts8VNLNSr6w2Gs
	+5YHcjxtNInMWo2Ej0bM0Zq4Oh3m+YnUavwK5jKmVDpD1NXf9fWbMhY6BK8uAAA3hpFj
	Kg4w==
X-Gm-Message-State: ALoCoQl69w5T8IqDW1T+J3H1ojOHctGKas1YmB6N+SsBUImxWqYlepePs0pBy0Bp38NCTuzoLSa7
X-Received: by 10.140.91.161 with SMTP id z30mr53777914qgd.65.1401792011172;
	Tue, 03 Jun 2014 03:40:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 3 Jun 2014 03:39:51 -0700 (PDT)
In-Reply-To: <71fd18d530e8470d0a3bc4289469976ee5f8989f.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
	<71fd18d530e8470d0a3bc4289469976ee5f8989f.1401765630.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Jun 2014 11:39:51 +0100
Message-ID: <CAJTo0LbewCWEhs=+ObRZ0WAWYbCUV3x7VnSd8KnoOXVguA40SQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] man-pages: Update to 3.68
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
X-List-Received-Date: Tue, 03 Jun 2014 10:40:12 -0000
Content-Type: text/plain; charset=UTF-8

On 3 June 2014 04:26, Saul Wold <sgw@linux.intel.com> wrote:
> -LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
> +LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"

Would it be easy to just checksum the license statement instead of the
entire file?

Ross

