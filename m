Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id D4B186B5C1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:48:56 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ia10so897120vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 08:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5YjrINsgZfv6zvMcmnBFdOeblkyLTcT8qcH4hpGDEGY=;
	b=KyUtViC/BM4NBA9+nCiBvpDNm4VhaHW0WXziJE6thzS1T1cHPw0ZjrDmXuex/c0sq1
	0A9sJIqHSajKwqROgMqUCfMiA/7CJxbOtVm/0gZuU9RLJC3OHckXgEQbDut/fzkPlxRt
	+TLh7dql+8v7TlMTZZ9Znj5A0nJ3BZEYJ0n12rxyVfH5rZ2BaQWLmrT7AQ5IAs6eCtQ5
	3HdUhQhrpIlSolj82ZRd1SAL+FL0T1uwhqTvbjVXAx/KJSGzci6LF+iJWy8lwGOFJJz8
	gpR6fgNXjjeaNXtJVg1nMKZZC9/lsU14fgcBbfOjmkACy2Oa5a5LU2/55yz+fMS8nCcH
	xzmg==
X-Gm-Message-State: ALoCoQk0AoZUGRfGmLI5L93c4oZEnHujkFHiVuxDTLB1pCE66zE4tG0lhM/eUuWuz7xqSmu5q/n0
X-Received: by 10.58.118.70 with SMTP id kk6mr783241veb.1.1376063337112; Fri,
	09 Aug 2013 08:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 9 Aug 2013 08:48:36 -0700 (PDT)
In-Reply-To: <cover.1376060231.git.sgw@linux.intel.com>
References: <cover.1376060231.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Aug 2013 16:48:36 +0100
Message-ID: <CAJTo0LaBb=c9Kw9UyEuwei2u+wfMyFi2LebXbdns64LjQ5aoVw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/17] Review & ACK
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
X-List-Received-Date: Fri, 09 Aug 2013 15:48:57 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2013 16:03, Saul Wold <sgw@linux.intel.com> wrote:
> I build this set, along with the Python3 and Read-Only, which are removed
> pending some more review, on the AB. While there were some failures due to
> other updates, those were also removed.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

