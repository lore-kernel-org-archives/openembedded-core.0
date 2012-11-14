Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYbcM-0002hn-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:58:54 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Nov 2012 03:44:21 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so1078093iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=weO1le4gMmWWRVD3IUznm150kNjzEZjKl/lErK+pm/s=;
	b=ZaAq+ePWYnOvXrkEYwgAAjdN+rJnIuYHKNtMraozIasRzXjRHy/ugCKCiBkLaxtvkY
	0euAsoVPBlmVBq5V4FnVonPy2tu5tc43VbLonVw5MIsfE2kLzHqL5xq0Rwbf5SuW4WC/
	cfR/f3ktl2Kbuaxrma0VKnbksPtimWXxcop1Nnp0NbAY+agqjKeDmVbnIOy3JCJGEBi+
	kes00O77KYC9EBIsIiojXcI7/py075/d2zDlLblrAINMyZ78bVNUbfI61FTSwZvUVtez
	9EW/bQhGvZVnBafQ2iGy66b00iFsKiJA2cH/d7JT4EKyr1Rct6jBok2r3YSVCGrNIrs6
	iO6g==
Received: by 10.60.10.201 with SMTP id k9mr8538030oeb.105.1352893497315;
	Wed, 14 Nov 2012 03:44:57 -0800 (PST)
Received: by 10.60.10.201 with SMTP id k9mr8538027oeb.105.1352893497204; Wed,
	14 Nov 2012 03:44:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Wed, 14 Nov 2012 03:44:36 -0800 (PST)
In-Reply-To: <CAP9ODKpNb6RuJ7Yg5dX_0Xi6uvNDfTuqM-PQLBMYF2fH4HpyEA@mail.gmail.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
	<fe918e16f7c7d4e01ab317c3f29ff7dab1ba9537.1352884713.git.laurentiu.palcu@intel.com>
	<CAP9ODKpNb6RuJ7Yg5dX_0Xi6uvNDfTuqM-PQLBMYF2fH4HpyEA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2012 11:44:36 +0000
Message-ID: <CAJTo0LbqG2SgOGY7kocoWWabsF0epT8owF3O_UCOb0+jshdcMg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQnXuAvKCyL4oh1Jv0WLAVyDFGdYE1UUqMx4YM8PPGTc/tM4eaG9M+ZCD10ibfat6U2c+bEascOEgfKE9jrNUyHq7EpvO3tz91378EPlfZhmynszdsHXRnTXBQcFgqSk1wCk58m3cfB2iiAK0hyLBcJWfDjNmd9Zx3AYoJC48iLs8vx7jAU1Jvph0727geGKz77iiYsZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 08/12] xserver-xorg: upgrade to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 11:58:55 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 11:28, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Why those are now built-in?

Because upstream made them builtin.

Ross


