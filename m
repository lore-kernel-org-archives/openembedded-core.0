Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPVem-0000BA-M8
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 12:20:09 +0200
Received: by mail-vb0-f52.google.com with SMTP id w8so4570272vbf.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 03:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=KMPnpFsdu6/ze3U/oTC1UIiFmEJhdHiWbg0J+sPxw0s=;
	b=DrWryJ1UXEZHzzcXAgOXLg9PVqGNekIyqb7jdGEjA/a3A1O512aZ9tC22xeXZlovJ8
	+RI1q888pSG1t1qkRLoyoEQWAa7ty8ROyliVgkeuOWoNHCJKVyQkvVPk78EoSV4SNcuD
	PXRl9i5B7cabRbbJI5l4r3j8Kjx+GGAfhBuzRNzDeFRYJNmwLqqpdynmkwVe/M+s1INn
	bBblthntRpWwzhF/2iBTAAjjEqECUE05UB6f6nsxDbpLxGh6P1drdJoOmZN7TU5UwueF
	6gETBpJpcdfBkpL+IWsPp+BS/uoQ4WZyONxAyuVKXW9qIroVXIy6qF9vzbp0bFZYViQ3
	xaYQ==
X-Received: by 10.220.119.200 with SMTP id a8mr18606459vcr.38.1365501764384;
	Tue, 09 Apr 2013 03:02:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 03:02:24 -0700 (PDT)
In-Reply-To: <5163E458.1080709@pseudoterminal.org>
References: <5162038C.2020706@pseudoterminal.org>
	<51634C0A.5040300@pseudoterminal.org>
	<CAJTo0La+4zFbSu1s8mDQ=oWUEzasRgi9Ufg433qbB=8sbde1gw@mail.gmail.com>
	<5163E458.1080709@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 11:02:24 +0100
Message-ID: <CAJTo0LZEA+8L7XftUY3EzLtWx5a6QwjnXsO8GzMLd839jQOHJA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Gm-Message-State: ALoCoQl0KjusyAPdu5xw/HYgpzFyYaJJdA5qwITchftGyIZS1C3Jxn+MviKfT2ukujDkACZgztSA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Tue, 09 Apr 2013 10:20:29 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 10:50, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> Okay, sounds good. But just liborc? Or yasm as well? yasm is crucial for
> ffmpeg and libav.

Good question and I can't give an instant answer for that.

Ross


