Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbDO-0004NG-4w
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:52:04 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:40:22 -0700
Received: by ghbz12 with SMTP id z12so6550880ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=lOVYEeJa2TcoGcZWHrCSBCA7MU4GRyV5sUMV/apfQoI=;
	b=NbZm8y2gaZgIp7q+AH221fjOSRfwMR5uGeQA49FbZPEZUw0++LW2l933T+vCrWclya
	xXbff+2DpUg81F+x0L38NY7708cxOyj5exBhtZjgmrgkwenCWkLvqRSDXqz74pHLnang
	KpKkAwyZTs5UKKyOUIGsrcREz2tYJxL2b67YwcYXFZM9h36AhuncHzLPeMO169Czso9E
	QJEZb1uiAiPRgS6q7/iD/JdzSxhpbUxiEjgK1Xz2ttJMhp+M998fhljt5WnCP5eh4pDK
	YTa1hlj7Nda1vRvRcnks6LS4WcTN6jU96YBjq5kERCGPg0cJTY42shP+QCW3ugdz7SrK
	W1vQ==
Received: by 10.60.3.194 with SMTP id e2mr29764690oee.1.1343835621153; Wed, 01
	Aug 2012 08:40:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 08:40:00 -0700 (PDT)
In-Reply-To: <ad0d7de863e412bb757f13e2d250fcab4e19dadb.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
	<ad0d7de863e412bb757f13e2d250fcab4e19dadb.1343835237.git.ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 16:40:00 +0100
Message-ID: <CAJTo0LbZi0Qp6MfPBaNUFOFgSJ_rSY70-=AQzFsnpJSmDajZig@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQk3F08GnyX5BkOtAMteDwD8iVHTcWarTNNOVuIMbas9Jffxgv4isL3c3YRFLco4K0uywfTq
Subject: Re: [PATCH 11/11] mesa-demos: fix GLES2 build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 15:52:06 -0000
Content-Type: text/plain; charset=UTF-8

In all my rebasing I lost a file, whoops.  Will re-send this one.

Ross


