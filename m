Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id C9F3C6E4CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:33:39 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n16so4692445oag.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 09:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Ul6EuwyDnfEyJanCvqB+R2uESY1KUhcW8C0so7TvTA8=;
	b=b9H1uUmD7fTw1sh/+5NnRT4hpYpp+pxAGYsHO8sMqRg1J8b0X1KRH3n9KvKUZY2nsj
	j6/07hQFrlw4AoV3A+kyGETymEB+w36ad/VNvdqSPTiXpw+sRczKsn3GgSXxFwEUTxtm
	THWpeupvv5o8t/IFRbAfIEk9PYyZv/Tj9QsBUciNnW1XnGNyiLbYPPmujGgTPuOJcYl2
	6Rt2xcY8swdhg2mxznNsscqQmeSIHDYPoVSa7Z94bOMeb0ZUDLFER9RMzeZB0L51Chx2
	VED3vV4PiPHcBZpyYo3jopg78RfDTTCtkn4mMXDtFZpT+fZOB8Q4qd96NpFWuhf4R/BO
	7Xng==
X-Gm-Message-State: ALoCoQmWA0zTByttGA6YGqNTti2pbeBMdGmo5LiBkv+SHhtcljj3uqCLXPIdfZJx0hiXCTRHwkZk
X-Received: by 10.182.118.169 with SMTP id kn9mr1055027obb.46.1395938019957;
	Thu, 27 Mar 2014 09:33:39 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	kn10sm10208269oeb.0.2014.03.27.09.33.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 09:33:39 -0700 (PDT)
Message-ID: <533452E2.9030407@linaro.org>
Date: Thu, 27 Mar 2014 12:33:38 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <1395676843.24890.7.camel@ted> <5330C9A8.904@linaro.org>
	<20140325055028.GA3710@jama> <5332E520.5050005@linaro.org>
	<CAP9ODKoSO6ewoim_4c6N15C5-uQz0XQ3kPam421mYRPhRcWoNg@mail.gmail.com>
	<CAP71Wjz2MD52m_ij09nCRZoDh6iJfojae7sJYK4ZwSqZ_qGVZQ@mail.gmail.com>
In-Reply-To: <CAP71Wjz2MD52m_ij09nCRZoDh6iJfojae7sJYK4ZwSqZ_qGVZQ@mail.gmail.com>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Thu, 27 Mar 2014 16:33:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Excellent information! Thanks for all the workflow examples, this is great.

